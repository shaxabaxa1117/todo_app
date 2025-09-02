# app/crud.py
from sqlalchemy.orm import Session
from . import models, schemas

def get_todos(db: Session):
    return db.query(models.ToDo).all()

def create_todo(db: Session, todo: schemas.ToDoCreate):  # Получаеи из аргумента Pydantc и создаем объект класса ToDo
    db_todo = models.ToDo(title=todo.title, description=todo.description)
    db.add(db_todo)
    db.commit()
    db.refresh(db_todo)
    return db_todo
