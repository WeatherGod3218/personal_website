import os
import json
import logging
from dotenv import load_dotenv

load_dotenv()

logger: logging.Logger = logging.getLogger(__name__)

BASE_DIR: str = os.path.dirname(os.path.abspath(__file__))
