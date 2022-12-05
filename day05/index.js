const fs = require('fs')

const data = fs.readFileSync('./input.txt').toString().split("\n\n")
const [rawStacks, procedures] = data;
const preStacks = rawStacks.split("\n");
const stacks = preStacks.slice(0, preStacks.length - 1);
const resultLength = preStacks[preStacks.length - 1].match(/\d/g).length;
const steps = procedures.trim().split("\n").map(step => {
  const steps = step.match(/move (\d+) from (\d+) to (\d+)/);
  return [steps[1], steps[2], steps[3]].map(s => parseInt(s))
});

const sortCrates = f => {
  const arr = [];
  const result = Array.from(Array(resultLength), () => new Array);

  stacks.forEach((_, i) => {
    const a = [];
    const b = stacks[i].split('');

    for (let j = 0; j < b.length/4; j++) {
      a.push(b.slice(j * 4, j * 4 + 4).join('').trim())
    }

    arr.push(a)
  })

  arr.forEach(row => {
    row.forEach((v, i) => {
      if (v !== '') {
        result[i].push(v)
      }
    })
  });

  steps.forEach(step => f(result, step))

  return result
}

const partOne = (() => {
  const f = (result, step) => {
    for (let i = 0; i < step[0]; i++) {
      result[step[2] - 1].splice(0, 0, result[step[1] - 1].splice(0, 1)[0])
    }
  }

  return sortCrates(f).map(v => v[0]).join('').replace(/[\]\[]/g, '')
})()

const partTwo = (() => {
  const f = (result, step) => result[step[2] - 1].splice(0, 0, ...result[step[1] - 1].splice(0, step[0]))

  return sortCrates(f).map(v => v[0]).join('').replace(/[\]\[]/g, '')
})()

console.log(`Part 1: ${partOne} - Part 2: ${partTwo}`)
