use std::collections::HashSet;

fn get_marker_pos(input: String, size: usize) -> usize {
    let b: Vec<char> = input.chars().into_iter().collect();
    let mut i = size - 1;
    for group in b.windows(size) {
        let poop = group.iter().collect::<HashSet<&char>>().len();
        i += 1;
        if poop == size {
            break;
        }
    }
    return i
}

fn main() -> std::io::Result<()> {
    let content = std::fs::read_to_string("input.txt")?.trim().to_owned();
    let part_one = get_marker_pos(content.clone(), 4);
    let part_two = get_marker_pos(content, 14);
    println!("Part one: {} - Part two: {}", part_one, part_two);

    Ok(())
}


#[cfg(test)]
mod tests {
    use super::*;

    // PART ONE
    #[test]
    fn sample_one() {
        let input = String::from("mjqjpqmgbljsphdztnvjfqwrcgsmlb");
        assert_eq!(get_marker_pos(input, 4), 7);
    }

    #[test]
    fn sample_two() {
        let input = String::from("bvwbjplbgvbhsrlpgdmjqwftvncz");
        assert_eq!(get_marker_pos(input, 4), 5);
    }

    #[test]
    fn sample_three() {
        let input = String::from("nppdvjthqldpwncqszvftbrmjlhg");
        assert_eq!(get_marker_pos(input, 4), 6);
    }

    #[test]
    fn sample_four() {
        let input = String::from("nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg");
        assert_eq!(get_marker_pos(input, 4), 10);
    }

    #[test]
    fn sample_five() {
        let input = String::from("zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw");
        assert_eq!(get_marker_pos(input, 4), 11);
    }
    // PART TWO
    #[test]
    fn sample_six() {
        let input = String::from("mjqjpqmgbljsphdztnvjfqwrcgsmlb");
        assert_eq!(get_marker_pos(input, 14), 19);
    }
    #[test]
    fn sample_seven() {
        let input = String::from("bvwbjplbgvbhsrlpgdmjqwftvncz");
        assert_eq!(get_marker_pos(input, 14), 23);
    }
    #[test]
    fn sample_eight() {
        let input = String::from("nppdvjthqldpwncqszvftbrmjlhg");
        assert_eq!(get_marker_pos(input, 14), 23);
    }
    #[test]
    fn sample_nine() {
        let input = String::from("nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg");
        assert_eq!(get_marker_pos(input, 14), 29);
    }
    #[test]
    fn sample_ten() {
        let input = String::from("zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw");
        assert_eq!(get_marker_pos(input, 14), 26);
    }
}
