const db = require("../data/db-config");

module.exports = {
  find,
  findById,
  findSteps,
  add,
  update,
  remove,
};

function find() {
  return db("schemes");
}

function findById(id) {
  if (id) {
    return db("schemes").where({ id }).first();
  } else {
    return null;
  }
}

function findSteps(id) {
  if (id) {
    return db("steps as p")
      .join("schemes as s", "p.scheme_id", "s.id")
      .select("p.id", "s.scheme_name", "p.step_number", "p.instructions")
      .where("s.id", id);
  } else {
    return null;
  }
}

function add(newScheme) {
  return db("schemes")
    .insert(newScheme)
    .then((newSchemeID) => {
      return findById(newSchemeID[0]);
    });
}

function update(changes, id) {
  return db("schemes").where({ id }).update(changes);
}

function remove(id) {
  return db("schemes").where({ id }).del();
}
