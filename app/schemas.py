from pydantic import BaseModel
from enum import Enum

class RoleEnum(str, Enum):
    client = "client"
    admin = "admin"

class ClientCreateSchema(BaseModel):
    name: str
    phone: str
    email: str
    password_hash: str
    role: RoleEnum = "client"  # Default to "client" if not provided

    class Config:
        orm_mode = True
