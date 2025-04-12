from fastapi import FastAPI, Depends
from sqlalchemy.orm import Session
from . import models, database

app = FastAPI()

# Создаём таблицы
models.Base.metadata.create_all(bind=database.engine)

# Dependency для получения сессии
def get_db():
    db = database.SessionLocal()
    try:
        yield db
    finally:
        db.close()

@app.get("/")
def read_root():
    return {"message": "Hello from Barbershop API!"}
