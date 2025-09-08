# app/crud.py
from sqlalchemy.orm import Session
from . import models, schemas
from .models import ToDo
from fastapi import  HTTPException

def get_todos(db: Session):
    return db.query(models.ToDo).all()

def create_todo(db: Session, todo: schemas.ToDoCreate):  # Получаеи из аргумента Pydantc и создаем объект класса ToDo
    db_todo = ToDo(title=todo.title, description=todo.description)
    db.add(db_todo)

    db.commit()
    db.refresh(db_todo)
    return db_todo

def delete_todo(db: Session, todo_id:int):
    todo = db.query(ToDo).filter(ToDo.id == todo_id).first()
    if not todo:
        raise HTTPException(status_code=404)

    db.delete(todo)
    db.commit()
    return {"message": f"User {todo_id} deleted successfully"}


def update_todo(db: Session, todo_id: int, todo_update: schemas.ToDoUpdate):

    db_todo = db.query(models.ToDo).filter(models.ToDo.id == todo_id).first()

    if not db_todo:
        raise HTTPException(status_code=404, detail="Todo not found")


    for key, value in todo_update.model_dump(exclude_unset=True).items():
        setattr(db_todo, key, value)


    db.commit()
    db.refresh(db_todo)  # обновляем объект из базы

    return db_todo


