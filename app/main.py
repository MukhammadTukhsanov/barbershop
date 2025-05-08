from fastapi import FastAPI, Depends, HTTPException
from sqlalchemy.orm import Session
from . import models, database, schemas, hash_password

app = FastAPI()

# Создаём таблицы
models.Base.metadata.create_all(bind=database.engine)

# Dependency для получения сессии
def get_db():
    db = database.SessionLocal()
    try:
        yield db
        print(db.fetchall())
    finally:
        db.close()

@app.get("/")
def read_root():
    return {"message": "Hello from Barbershop API!"}
@app.post("/clients/")
def create_client(client: schemas.ClientCreateSchema, db: Session = Depends(get_db)):
    db_client = db.query(models.ClientCreate).filter(models.ClientCreate.email == client.email).first()
    if db_client:
        raise HTTPException(status_code=400, detail="Email already registered")

    new_client = models.ClientCreate(
        name = client.name,
        phone = client.phone,
        email = client.email,
        password_hash = hash_password(client.password_hash),
        role = client.role
    )
    
    db.add(new_client)
    db.commit()
    db.refresh(new_client)
    return new_client