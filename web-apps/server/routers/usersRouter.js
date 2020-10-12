import express from 'express'
import jwt from '../library/jwt'
const router = express.Router()
import table from '../library/db'
import { check, validationResult } from 'express-validator'
import asyncHandler from 'express-async-handler'
const db = table("users")
/*
  ---
*/
router.get('/me', asyncHandler(async (req,res) => { //get all
  let p = jwt.verify(jwt.getToken(req.headers.authorization)).results
  var query = db.select().where({id: p.id}).build()
  let q = await db.query(query)
  res.json(q.res[0])
}))

module.exports = router
