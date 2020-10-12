import mysql from 'mysql'
const db =  mysql.createPool({
  connectionLimit: 10,
  host:process.env.DB_HOST,
  user:process.env.DB_USER,
  password:process.env.DB_PASS,
  database:process.env.DB_NAME
})
db.getConnection((err, con) => {
  if (err) console.log(err)
  else console.log(`DB ${process.env.DB_NAME} connected`)
})
export default db
