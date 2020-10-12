import db from '../config'
import sql from 'sql-query'
const sqlQuery = sql.Query()

const query = (table) => {
  const queries = {
    query: (q) => {
      return new Promise ((es) => {
        db.query(q,(err,data)=>{
          if (err) es({status:false, res: err})
          else es({status: true, res: data})
        })
      })
    },
    select: (tbl) => {
      var q = sqlQuery.select()
      if (tbl) return q.from(tbl)
      else return q.from(table)
    },
    update: (tbl) => {
      var q = sqlQuery.update()
      if (tbl) return q.into(tbl)
      else return q.into(table)
    },
    delete: (tbl) => {
      var q = sqlQuery.remove()
      if (tbl) return q.from(tbl)
      else return q.from(table)
    },
    insert: (tbl) => {
      var q = sqlQuery.insert()
      if (tbl) return q.into(tbl)
      else return q.into(table)
    }
  }
  return queries
}

export default query
