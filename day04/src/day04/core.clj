(ns day04.core
  (:require [clojure.string :as str]))

(defn to-range
  [[x y]]
  (let [parse-int #(Integer/parseInt %)]
  (range (parse-int x) (+ (parse-int y) 1))))

(defn subseq?
  [x y]
  (let [size-x (count x)
        size-y (count y)]
  (if (< size-x size-y)
  (some #{x} (partition (count x) 1 y))
  (some #{y} (partition (count y) 1 x)))))

(defn parse-data
  [input]
  (let [raw-data (map #(str/split % #",") (str/split input #"\n"))
        split-at-dash #(str/split % #"-")
        fonfon #(to-range (split-at-dash %))]
        (map #(map fonfon %) raw-data)))

(defn pre-process
  [data f]
  (map #(let [[x y] %] (f x y)) data))

(defn part
  [input f]
  (let [parsed-data (parse-data input)
        pre-processed (pre-process parsed-data f)]
  (reduce #(+ % %2) (map #(if % 1 0) pre-processed))))

(defn -main
  []
  (let [one (part (slurp "input.txt") subseq?)
        two (part (slurp "input.txt") #(some (into #{} %) %2))]
  (println (str "Part one: " one " - Part two: " two))))
