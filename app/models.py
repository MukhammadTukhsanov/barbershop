from sqlalchemy import Column, Integer, String, Enum,DateTime
from sqlalchemy.sql import func
from .database import Base
import enum

class RoleEnum(enum.Enum):
    client = "client",
    admin = "admin"

class ClientCreate(Base):
    __tablename__ = "client"
    
    id = Column(Integer, primary_key=True, index=True)

    name = Column(String(50))
    phone = Column(String(20))
    email = Column(String(100))
    password_hash = Column(String(20))
    role = Column(Enum(RoleEnum), default=RoleEnum.client)
    created_at = Column(DateTime, default=func.current_timestamp)

    class Config:
        orm_mode = True
