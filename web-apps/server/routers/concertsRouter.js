import express from 'express'
import jwt from '../library/jwt'
const router = express.Router()
import table from '../library/db'
import { check, validationResult } from 'express-validator'
import asyncHandler from 'express-async-handler'
import sql from 'sql-query'
const db = table("concerts")
/*
  ---
*/
router.get('/', asyncHandler(async (req,res) => { //get all
  let p = jwt.verify(jwt.getToken(req.headers.authorization)).results
  if (req.query.limit) var query = db.select().limit(req.query.limit).build()
  else if (req.query.q) var query = db.select().where({
    title: sql.like(`%${req.query.q}%`),
    artist: sql.like(`%${req.query.q}%`),
    about: sql.like(`%${req.query.q}%`)
  }).build()
  else var query = db.select().build()
  let q = await db.query(query)
  res.json(q)
}))

router.get('/:id_concert', asyncHandler(async (req,res) => { //get all
  let p = jwt.verify(jwt.getToken(req.headers.authorization)).results
  var query = db.select().where({id: req.params.id_concert}).build()
  let q = await db.query(query)
  res.json(q)
})) 

module.exports = router
