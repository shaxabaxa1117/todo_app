from pydantic import BaseModel


class TaskBase(BaseModel):
    title: str
    descripton:str | None = None

class TaskCreate(TaskBase):
    pass

class TaskResponse(TaskBase):
    id: int
    done: bool

    class Config:
        orm_mode = True