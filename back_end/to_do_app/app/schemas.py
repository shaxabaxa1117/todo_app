# app/schemas.py
from pydantic import BaseModel

class ToDoBase(BaseModel):
    title: str
    description: str | None = None

class ToDoCreate(ToDoBase):
    pass

class ToDoRead(ToDoBase):
    id: int
    is_completed: bool

class ToDoUpdate(ToDoBase):
    id: int
    is_completed: bool

    class Config:
        orm_mode = True
