from pymongo import MongoClient


client = MongoClient('mongodb+srv://apereto:196422@cluster0.ka8npzg.mongodb.net/?retryWrites=true&w=majority')

db = client['markdb']

def remove_user_by_email(user_email):
    users = db['users']
    users.delete_many({'email': user_email})
    print('Removendo o email' + user_email)

def insert_user(user):
        users = db['users']
        users.insert_one(user)
        print(user)