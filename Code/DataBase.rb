require 'sqlite3'

class DataBase
    def create()
        db = connect()
        db.execute "CREATE TABLE IF NOT EXISTS series(series_id INTEGER PRIMARY KEY, reps INTEGER, weight REAL, time INTEGER"
        db.execute "CREATE TABLE IF NOT EXISTS excersise(excersise_id INTEGER PRIMARY KEY, name TEXT, series_id INTEGER, FOREIGN KEY(series_id) REFERENCES series(series_id)"
        db.execute "CREATE TABLE IF NOT EXISTS training(training_id INTEGER PRIMARY KEY, date TEXT, excersises_id INTEGER, FOREIGN KEY(excersises_id) REFERENCES excersise(excersise_id)"
    end

    def insert_random_data()
        db = connect()
        db.execute "INSERT INTO series(reps, weight, time) VALUES (10, 14, 0)"
        db.execute "INSERT INTO series(reps, weight, time) VALUES (8, 14, 0)"
        db.execute "INSERT INTO series(reps, weight, time) VALUES (6, 12, 0)"
        db.exceute "INSERT INTO excersise(name, series_id) VALUES ('dumbell curl', )"
    end

    def insert_training(training)

    end

    private:

    def connect(db_name = 'training.db')
        SQLite3::Database.new db_name
    end

    def insert_excersise(excersise)

    end

    def insert_series(series)

    end

end