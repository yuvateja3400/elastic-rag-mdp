from pydantic import BaseSettings

class Settings(BaseSettings):
    elastic_url: str = "http://localhost:9200"
    elastic_index: str = "rag_documents"
    drive_folder: str = "./data/pdfs"
    chunk_size: int = 300
    chunk_overlap: int = 50

    class Config:
        env_file = ".env"

settings = Settings()
