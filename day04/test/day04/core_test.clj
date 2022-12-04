(ns day04.core-test
  (:require [clojure.test :refer [deftest is testing]]
            [day04.core :refer :all]))

(def input-data (slurp "input.txt"))
(def sample-data (slurp "sample.txt"))

(deftest sample-part-one-test
  (testing "Part one with sample should return 2"
    (is (= 2 (part sample-data subseq?)))))

(deftest input-part-one-test
  (testing "Part one with input should return 507"
    (is (= 507 (part input-data subseq?)))))

(deftest sample-part-two-test
  (testing "Part two with sample should return 4"
    (is (= 4 (part sample-data #(some (into #{} %) %2))))))

(deftest input-part-two-test
  (testing "Part two with input should return 897"
    (is (= 897 (part input-data #(some (into #{} %) %2))))))
