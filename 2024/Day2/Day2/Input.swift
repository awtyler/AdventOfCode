//
//  Input.swift
//  Day2
//
//  Created by Aaron Tyler on 11/3/23.
//

import Foundation

enum Input {
    
    enum InputType {
        case sample
        case real
    }

    static var executionPart: ExecutionPart = .part1
    static var inputType: InputType = .sample
    
    static var input: String {
        if inputType == .sample {
            return input_sample
        }
//        return input_real
        return (input_real + "\n") * 100
    }
    
    static func getInput() -> [Report] {
        let lines = input.split(separator: "\n").map { String($0) }

        var reports = [Report]()
        for line in lines {
            reports.append(Report(levels: line.split(separator: " ").map { Int(String($0)) ?? 0 }))
        }
        
        return reports
    }
    
    static let input_sample = """
    7 6 4 2 1
    1 2 7 8 9
    9 7 6 2 1
    1 3 2 4 5
    8 6 4 4 1
    1 3 6 7 9
    """
    
    static let input_real = """
    18 21 22 24 26 29 28
    9 11 14 17 18 21 21
    48 51 54 56 60
    6 8 10 11 16
    75 76 79 82 80 83
    28 31 33 32 33 30
    94 96 94 96 96
    42 44 45 44 46 50
    25 28 29 26 33
    37 39 39 42 43
    49 51 53 56 56 57 55
    88 91 91 93 96 99 99
    56 59 59 61 62 65 68 72
    30 33 35 37 39 42 42 49
    14 17 19 23 24
    2 4 5 9 12 15 16 14
    88 89 93 96 99 99
    68 70 71 74 78 81 85
    46 47 49 53 58
    36 39 41 47 49 50 51 54
    81 82 85 91 93 95 96 94
    11 14 16 18 23 23
    72 75 81 84 85 89
    40 41 44 46 51 53 58
    70 68 71 73 76 77 78 80
    83 80 83 86 83
    44 42 45 47 49 51 51
    78 77 80 81 83 85 88 92
    34 33 34 36 38 45
    54 51 52 54 56 57 56 59
    57 54 53 55 52
    48 46 47 49 47 47
    70 67 64 65 67 70 72 76
    42 41 42 45 44 46 53
    44 41 44 47 47 50 51 53
    12 11 13 13 12
    27 25 25 26 26
    57 55 55 58 61 65
    65 63 65 68 69 69 71 78
    88 87 91 93 94
    84 82 84 86 90 92 93 92
    22 21 25 27 28 28
    35 33 35 36 40 43 44 48
    32 30 31 33 37 44
    30 28 30 36 38
    70 67 69 70 77 75
    42 39 44 47 47
    47 45 48 53 57
    32 29 34 35 36 39 40 46
    71 71 74 75 77
    14 14 16 18 20 19
    43 43 44 47 49 51 51
    71 71 72 73 75 76 80
    10 10 12 14 15 16 22
    42 42 45 42 45 48
    72 72 75 73 74 75 73
    82 82 85 87 84 86 89 89
    68 68 65 67 71
    19 19 20 21 19 26
    87 87 89 89 92
    78 78 80 81 82 82 80
    11 11 11 13 13
    54 54 57 58 58 62
    23 23 23 26 29 34
    8 8 12 13 16 19
    38 38 42 43 46 47 49 47
    30 30 31 35 36 37 37
    23 23 27 29 31 35
    4 4 6 10 13 16 18 25
    44 44 47 52 54 56 57
    32 32 39 40 37
    10 10 13 18 20 23 23
    46 46 52 55 59
    66 66 73 76 81
    54 58 61 64 66 69 71 74
    7 11 14 17 19 22 20
    16 20 21 23 24 27 29 29
    83 87 90 91 95
    1 5 6 8 13
    60 64 65 64 67 68 69 71
    54 58 61 64 66 69 66 64
    74 78 81 80 83 83
    61 65 68 70 69 70 72 76
    84 88 90 91 88 90 96
    78 82 85 87 87 89 91 94
    75 79 81 81 82 84 86 83
    2 6 7 7 8 9 9
    9 13 14 14 15 19
    1 5 5 8 14
    76 80 82 86 88 90
    78 82 84 88 89 86
    60 64 68 71 74 74
    40 44 46 50 54
    30 34 35 38 42 45 47 52
    51 55 62 64 67 70 71 72
    37 41 42 43 48 51 48
    11 15 16 17 24 24
    20 24 29 32 33 37
    61 65 67 72 74 81
    45 52 55 56 59 60 63
    23 29 32 34 32
    63 70 71 72 75 78 80 80
    66 73 75 78 81 84 88
    19 24 25 28 29 36
    67 72 70 71 74 75 77 80
    30 35 36 38 37 38 39 37
    82 89 90 92 94 91 91
    67 74 77 78 81 84 82 86
    27 34 35 32 33 35 38 45
    20 27 30 30 33
    71 78 81 82 82 79
    54 60 60 63 64 64
    31 37 38 40 40 44
    66 71 73 73 78
    32 37 39 41 43 47 50
    50 55 56 60 62 60
    69 76 80 81 84 84
    52 59 63 64 68
    53 59 60 64 71
    72 78 80 86 87 89 92
    28 33 36 38 44 46 45
    34 40 43 44 47 52 52
    2 9 11 17 20 24
    32 39 46 47 50 55
    41 38 35 34 32 31 28 29
    84 81 80 78 77 77
    56 54 51 49 48 47 43
    65 62 60 59 56 53 46
    35 34 31 34 32 29 27 25
    41 40 39 42 45
    63 60 57 56 59 58 58
    68 67 66 63 66 64 62 58
    94 91 90 93 91 90 83
    60 58 56 56 54 52 51 49
    85 82 82 79 77 76 75 76
    70 68 66 66 65 62 62
    56 53 50 50 46
    48 47 46 43 42 42 41 35
    68 67 66 65 61 59
    65 62 59 58 56 55 51 53
    76 74 73 70 69 65 65
    29 28 27 23 20 19 15
    88 86 82 81 79 78 76 71
    78 75 70 67 65 63
    22 20 14 13 15
    80 79 77 72 72
    39 38 36 33 26 23 19
    69 68 66 59 56 53 51 45
    55 56 55 53 51 50
    38 41 38 35 34 37
    70 73 71 68 66 66
    57 60 58 56 52
    39 40 37 34 28
    6 9 7 6 4 7 5 3
    82 85 84 87 90
    13 14 15 14 12 12
    97 98 96 98 94
    21 24 26 23 21 16
    39 41 41 39 38 36
    85 87 87 84 82 79 82
    80 81 81 79 77 77
    67 69 68 65 65 61
    80 82 82 80 77 74 67
    89 92 89 85 82
    49 50 49 45 47
    59 62 58 57 55 53 52 52
    32 35 31 30 26
    39 41 39 38 37 35 31 24
    29 30 29 24 23 21 19 17
    13 14 12 7 8
    31 33 31 30 23 22 19 19
    24 26 21 18 16 12
    37 39 38 33 32 31 25
    91 91 90 89 86 83 80
    56 56 55 53 55
    84 84 83 81 79 79
    38 38 35 33 31 28 25 21
    35 35 32 31 29 28 25 19
    23 23 22 23 21 20 17 16
    22 22 19 21 24
    9 9 10 9 7 7
    82 82 79 81 79 75
    29 29 30 29 23
    16 16 15 15 12 10
    32 32 29 27 25 25 26
    23 23 20 20 20
    98 98 97 96 93 93 89
    60 60 57 57 55 53 48
    72 72 69 65 62 61 58 57
    57 57 54 53 49 51
    59 59 57 53 51 51
    77 77 73 71 67
    20 20 18 14 13 7
    20 20 13 11 10 8
    74 74 71 70 69 68 62 63
    38 38 33 31 28 26 23 23
    91 91 90 84 80
    86 86 83 82 80 78 71 64
    94 90 88 85 84 81
    61 57 56 55 52 50 48 51
    31 27 25 22 19 19
    79 75 73 70 68 65 61
    87 83 81 78 75 70
    23 19 16 14 13 16 14 11
    9 5 7 4 7
    88 84 82 84 84
    21 17 15 14 17 14 11 7
    60 56 55 54 55 53 51 45
    57 53 53 50 48 47 46
    66 62 60 57 54 51 51 54
    74 70 69 67 66 66 64 64
    31 27 24 21 21 20 17 13
    38 34 31 28 28 21
    86 82 81 78 76 72 69
    21 17 14 12 11 7 10
    17 13 11 7 7
    36 32 31 28 24 22 20 16
    41 37 33 31 28 27 20
    36 32 31 25 22 21
    69 65 62 56 59
    47 43 42 37 35 32 32
    52 48 46 44 39 36 32
    98 94 93 86 84 78
    75 69 68 66 65 62 60 58
    74 68 66 63 62 65
    36 29 26 25 24 23 23
    74 69 68 65 63 60 58 54
    75 70 67 65 63 61 54
    43 38 39 36 33 30
    31 25 22 19 20 19 21
    13 8 5 6 4 4
    19 14 12 15 14 10
    37 31 33 30 27 21
    93 88 88 86 83
    19 13 13 11 10 11
    79 74 74 71 71
    45 39 39 38 35 34 31 27
    52 47 45 42 42 40 33
    54 47 44 41 40 36 35 33
    18 13 11 8 4 2 5
    83 78 74 73 70 70
    16 10 9 5 1
    35 30 26 25 24 19
    63 57 55 50 47 44 42
    20 15 8 7 5 7
    68 61 56 54 54
    80 75 69 67 65 61
    35 30 29 27 24 18 13
    60 61 63 64 67 64
    20 23 25 27 28 28
    62 63 65 67 70 72 76
    83 86 89 92 93 99
    14 16 17 16 18 21 23
    7 8 11 8 10 7
    40 43 40 43 45 45
    76 79 78 79 82 85 88 92
    40 43 45 44 47 50 52 58
    69 72 73 74 77 79 79 80
    11 13 15 15 16 15
    2 3 3 5 8 11 11
    64 67 68 68 72
    48 51 54 54 60
    1 2 6 9 10 13
    79 80 82 86 88 89 86
    22 23 27 30 33 36 36
    73 76 78 82 86
    9 11 13 17 18 23
    55 58 59 61 68 71
    5 8 11 18 17
    22 25 27 28 29 35 35
    60 63 64 67 74 77 81
    66 67 73 75 78 84
    62 60 62 63 66
    23 20 21 23 24 21
    38 37 38 40 42 42
    9 7 8 9 12 16
    79 78 80 82 84 85 88 95
    13 12 14 11 14
    60 57 60 59 61 58
    11 10 11 8 8
    7 6 9 11 8 12
    25 23 24 25 23 30
    3 2 3 3 4 5
    65 63 66 68 71 74 74 72
    51 50 50 51 53 53
    67 66 69 72 72 76
    67 64 66 66 69 74
    74 71 74 76 79 83 84
    76 75 77 81 82 79
    43 42 46 49 50 50
    19 17 19 21 24 26 30 34
    33 31 33 37 40 41 43 49
    22 19 20 25 27 30
    62 60 66 69 66
    55 53 58 59 61 63 66 66
    19 16 21 22 25 29
    31 29 31 36 38 43
    24 24 25 26 29 32 35
    16 16 19 20 18
    42 42 43 46 46
    86 86 89 92 96
    56 56 57 60 65
    62 62 59 61 64
    75 75 77 80 77 80 83 82
    31 31 33 32 32
    60 60 62 63 65 62 66
    5 5 7 6 8 9 14
    41 41 44 46 46 49 52 55
    12 12 14 16 16 19 20 18
    23 23 24 24 25 26 27 27
    3 3 3 5 7 11
    83 83 84 84 86 91
    62 62 66 67 68
    39 39 41 43 46 48 52 50
    28 28 31 32 34 38 38
    11 11 15 17 21
    77 77 81 82 83 85 90
    49 49 52 59 62 64 67 70
    32 32 37 39 38
    80 80 85 86 88 88
    7 7 10 16 20
    33 33 36 38 40 46 51
    68 72 75 77 80 83 84 87
    58 62 63 66 67 66
    7 11 13 16 17 17
    17 21 23 24 25 26 30
    53 57 60 63 70
    27 31 30 32 33 35
    26 30 31 33 30 27
    16 20 21 22 21 24 25 25
    21 25 26 29 32 31 35
    66 70 67 69 70 72 74 80
    17 21 21 23 25 27 29
    57 61 64 67 67 68 67
    87 91 93 94 94 97 97
    76 80 82 82 83 84 87 91
    19 23 24 27 27 32
    34 38 40 44 47
    6 10 13 14 17 20 24 21
    48 52 53 57 59 59
    79 83 87 89 93
    73 77 79 82 84 88 93
    41 45 48 50 52 57 58 59
    49 53 58 60 61 58
    8 12 17 18 20 20
    2 6 7 10 12 14 20 24
    75 79 85 87 88 90 93 99
    60 67 70 73 76 78 80
    61 67 68 69 68
    63 69 70 73 73
    42 48 51 52 54 56 60
    71 78 79 81 88
    79 86 89 91 94 93 95 96
    48 55 52 54 56 59 58
    32 38 41 43 46 43 43
    54 61 62 60 63 67
    83 89 90 92 93 92 98
    34 41 43 43 45 47
    44 49 49 51 48
    36 43 44 44 44
    54 61 64 67 67 71
    21 28 31 31 34 40
    3 8 12 15 18 19
    54 59 60 61 65 63
    20 25 29 30 30
    61 67 70 72 76 79 80 84
    56 63 66 67 71 72 75 80
    12 19 26 28 29 31
    42 49 51 53 58 56
    22 29 30 36 36
    64 71 74 76 81 85
    65 72 79 82 87
    60 58 56 53 51 52
    26 23 22 20 18 17 17
    50 48 46 43 41 40 36
    99 96 95 92 86
    23 21 19 20 19 17 14 13
    82 79 78 75 73 71 74 76
    85 83 84 81 81
    79 77 75 73 71 72 68
    63 62 64 63 60 58 51
    16 13 11 8 5 5 4 1
    22 20 17 16 16 15 13 16
    54 51 48 48 48
    92 91 91 88 84
    22 19 17 16 13 13 11 4
    47 45 42 40 39 36 32 29
    55 53 49 48 46 43 45
    32 30 28 27 23 20 20
    87 85 81 80 79 76 75 71
    78 75 71 68 67 66 59
    18 17 14 12 9 4 1
    44 43 40 38 33 36
    76 74 72 66 64 64
    17 15 12 7 5 1
    31 30 27 21 18 16 11
    12 15 12 11 8 7 5 4
    40 42 40 39 37 34 31 32
    64 67 65 63 60 59 58 58
    12 14 12 11 8 7 3
    38 39 37 34 32 31 30 23
    91 94 93 96 94 91
    96 97 99 98 96 95 96
    69 71 68 67 69 68 68
    89 90 93 90 86
    30 31 28 30 25
    85 87 84 84 81
    40 42 42 41 43
    95 98 96 96 93 93
    68 71 71 68 66 64 61 57
    53 55 55 52 50 44
    58 59 56 55 51 49 46
    85 88 84 83 84
    73 75 73 69 68 65 65
    11 13 10 6 2
    65 66 64 60 55
    46 48 43 41 38
    11 12 7 6 3 5
    39 40 39 34 34
    94 96 91 90 87 86 82
    78 81 78 76 69 67 65 59
    99 99 96 93 91
    86 86 85 82 85
    60 60 58 56 55 53 53
    97 97 94 91 88 84
    57 57 54 52 50 48 46 41
    48 48 50 49 46
    96 96 95 97 95 92 94
    82 82 81 80 81 81
    61 61 58 61 57
    47 47 44 45 42 39 34
    17 17 15 12 12 9 8
    73 73 71 69 69 66 65 68
    51 51 48 46 46 43 41 41
    34 34 31 28 28 25 21
    53 53 52 50 50 47 46 41
    73 73 69 68 65 63
    81 81 77 75 72 74
    41 41 39 37 36 35 31 31
    89 89 88 87 84 80 76
    56 56 54 51 48 46 42 37
    22 22 20 19 12 9 6 3
    11 11 5 4 7
    92 92 89 88 87 86 81 81
    48 48 42 41 40 37 36 32
    34 34 31 24 17
    34 30 28 26 24 23 22
    92 88 87 86 85 82 85
    93 89 87 84 83 81 81
    62 58 57 56 52
    47 43 42 39 36 31
    90 86 83 84 83
    34 30 29 26 23 24 25
    73 69 72 69 67 66 66
    44 40 39 42 38
    93 89 87 86 88 82
    57 53 51 51 49 46 44
    83 79 78 78 77 74 75
    48 44 43 42 40 40 37 37
    24 20 20 19 16 12
    63 59 56 56 53 48
    39 35 34 31 28 24 23
    48 44 40 37 34 33 32 33
    72 68 64 63 62 62
    84 80 76 74 72 70 66
    76 72 71 68 67 63 60 53
    47 43 42 41 36 35 33 32
    63 59 58 57 51 48 47 50
    34 30 23 22 22
    81 77 75 73 72 71 64 60
    92 88 81 78 75 69
    51 45 44 43 42 39 36
    49 44 43 40 38 40
    83 77 75 72 72
    37 30 27 24 21 17
    94 87 86 83 82 81 80 75
    95 90 93 91 88 87 85 82
    39 33 30 27 29 30
    62 56 59 57 54 51 48 48
    59 53 55 53 49
    29 22 20 19 18 17 19 14
    69 63 62 62 61 59 57
    29 24 21 21 18 21
    88 82 81 80 79 79 77 77
    58 51 50 50 46
    85 80 78 78 75 69
    66 61 60 56 53 52 49 47
    20 13 10 6 4 3 5
    16 10 8 7 3 2 2
    72 65 61 58 57 55 51
    58 52 48 46 44 42 39 32
    62 55 49 48 46 43
    93 86 83 81 80 74 76
    77 70 68 61 61
    50 45 43 37 36 35 33 29
    41 36 33 26 21
    52 55 60 62 63 63
    68 66 66 65 64 62 62
    19 20 18 14 12
    71 75 78 80 80 82 89
    1 8 13 14 18
    78 83 84 85 86 88 86
    85 83 80 76 73 72 72
    32 31 35 37 39 37
    71 72 71 70 68 61
    14 18 21 21 23 26 29 32
    54 60 62 65 63 69
    74 72 69 71 75
    12 9 12 15 17 18 15
    54 61 66 69 72 74 74
    41 46 47 49 51 55
    77 71 74 71 68 65 59
    43 43 42 42 41 39 40
    68 61 60 57 56 49 48 45
    13 13 15 16 14
    85 87 88 88 90 92 98
    14 11 8 8 6
    50 50 47 44 40 37 36 31
    79 80 82 83 85 86 87 91
    39 46 49 49 53
    3 10 13 15 16 16 15
    45 41 40 37 37
    22 20 22 19 21 19
    17 17 15 16 18 19 26
    68 65 72 75 74
    51 55 58 61 61 62 65 62
    36 36 33 30 29 28 26 19
    15 20 19 21 23 25 26 29
    43 41 39 37 40 43
    69 66 66 68 69 69
    63 63 62 59 56 55
    15 19 21 23 25 28 32
    52 55 53 46 44 40
    25 19 17 13 12 11 6
    8 10 11 14 19 21 19
    52 48 46 43 39
    30 30 29 27 23
    43 45 42 41 37 36 36
    20 20 27 30 33 35
    88 89 94 95 98
    72 73 69 66 59
    57 64 67 69 74 76
    82 79 76 77 76 73 71 64
    96 98 96 95 94 92 92 92
    92 94 91 88 86 82 85
    97 93 93 92 89 88 85 83
    18 22 25 29 32 33 36 38
    38 34 34 32 35
    37 38 37 36 35 32 30 30
    67 68 71 71 73 76
    44 43 43 42 45
    47 49 48 46 42 38
    27 23 20 16 9
    7 9 8 10 3
    92 85 82 81 78 74 72 73
    24 20 23 20 19 15
    87 87 84 83 80 77 70 70
    55 58 58 56 52
    69 76 77 80 86
    56 59 65 68 72
    87 83 82 78 77 73
    68 73 75 79 80 83 82
    55 51 51 48 42
    12 17 20 19 20 21 22 19
    92 95 98 99 97 97
    34 30 27 24 25 23 22 20
    23 27 27 28 28
    52 50 50 48 44
    75 73 71 64 61
    69 69 63 61 57
    20 20 21 22 26 29
    25 27 29 29 32 35 38 36
    28 32 34 35 36 43 45
    41 41 42 47 47
    44 41 43 48 50
    71 71 74 75 78 82 86
    16 16 16 14 12 12
    7 8 11 14 14 18
    26 30 32 34 36 36
    62 63 61 54 52 53
    65 71 72 75 72 75 75
    54 58 62 64 70
    35 35 38 39 43 45 50
    78 82 83 87 88 92
    32 32 35 32 30
    52 49 51 54 56
    28 28 31 29 27 27
    2 2 5 6 7 14 18
    75 75 78 82 79
    64 61 59 56 54 52 49 48
    55 53 50 49 47 46 45 44
    55 53 51 48 46 45 42
    65 67 70 72 74 75
    88 91 92 93 95 97 98
    99 96 95 93 92 91
    1 3 6 9 11
    73 72 70 68 66 64
    40 42 45 46 49
    56 57 59 60 62 65 67
    64 62 60 59 57 54 51 49
    23 22 21 18 15 14 12
    8 10 12 14 17 20
    21 20 18 15 13 10 9
    26 28 29 32 33 36 39
    21 20 17 15 14 11 10
    32 30 29 27 25 24
    27 30 32 34 37 39
    29 31 33 35 37 39 42 45
    41 44 46 47 50 51 52 55
    19 18 16 15 13
    56 55 52 49 47
    62 64 65 68 70 71 72 73
    63 64 66 69 72
    41 39 38 36 35
    9 12 15 17 19 21
    18 21 24 26 27 28
    81 82 84 87 88 91 92 93
    31 34 36 37 40 41 42 45
    31 29 27 25 23 20 19
    67 70 72 74 75 76
    65 63 60 57 54 52 51
    38 35 34 33 30 29 27
    60 61 62 64 66 68 69
    75 74 71 69 67
    37 35 34 33 32
    37 38 40 42 45 48 50
    76 77 80 82 84
    58 61 63 64 65 67 69
    83 80 78 76 75
    11 8 7 6 3 2
    55 58 59 61 63 65 66 69
    77 79 80 81 83
    28 30 33 34 35 36 39
    78 76 74 72 71
    85 88 90 91 94
    46 44 41 40 38 36 33
    32 35 37 40 41 43 46 49
    37 38 41 42 43
    30 33 34 36 37 39 40 41
    35 32 29 26 23 22
    85 86 87 89 90 93 95
    82 83 84 86 88 90
    25 24 22 21 19 17
    74 71 68 67 66 63
    27 29 30 31 32 34 35 37
    16 19 21 23 26 28 31
    76 77 79 80 83
    86 84 82 80 78
    31 32 35 37 39 41 43 45
    95 92 90 87 84 81 79 77
    34 31 28 27 26 23 20 18
    9 8 5 3 1
    55 52 51 50 47 44 41 39
    10 12 15 18 19
    21 20 17 16 13 10
    50 53 56 58 61 63 66 69
    96 95 94 91 88 87
    71 69 67 65 64
    28 29 31 33 35
    13 15 18 19 22
    71 68 66 63 62 61 58
    57 54 51 50 47 45 44 42
    84 81 79 77 76 73 71 69
    40 43 44 46 48
    17 20 22 24 25 26
    31 33 36 38 41 44 47 49
    13 16 19 20 22 25 28 30
    71 69 68 67 65 63
    49 52 54 57 60 63 66
    63 61 59 57 56 55
    87 90 93 96 97 98
    75 77 78 80 82 85
    19 20 22 24 27
    42 43 46 47 49 52
    9 6 5 3 2 1
    77 74 71 68 65 64 63 62
    15 13 12 10 7
    20 18 15 14 12 11 9
    68 66 64 61 60 58
    3 5 8 11 12 14 16
    26 24 23 20 17 15 13
    49 51 53 54 57 58
    15 16 19 21 23 25 26 29
    44 47 48 51 52 54 55 56
    72 74 76 77 79 80 83
    13 12 10 8 7 4 3
    5 7 9 11 12
    65 62 60 57 54 52 50 47
    43 45 46 49 50 51 53 56
    88 90 92 94 96
    70 71 74 77 78 81 82
    11 10 9 6 3 2
    51 53 56 59 61 62 64 66
    24 25 27 30 33
    18 15 14 12 11 10 8 6
    31 34 35 36 39 42 43 46
    82 85 88 89 91 94 95
    67 69 72 73 74
    5 8 10 11 12 13
    45 43 40 37 36 34 33
    50 52 53 54 55
    13 12 11 8 7 5
    24 26 29 32 35 37
    40 37 34 31 28
    41 44 47 50 51
    49 52 55 58 60 62 63
    57 56 54 53 52 50 49
    10 7 4 3 2
    14 11 9 8 6 4 3
    44 42 39 37 36 34
    51 53 54 57 58 60 62
    53 52 50 48 46 44 43 41
    46 44 43 42 40
    68 65 63 62 59 57 55
    49 51 52 54 56 57
    52 50 48 47 45 44 41
    73 72 69 66 65
    79 82 84 87 89 91 94
    39 41 42 44 45 46 49 50
    85 82 79 77 76
    47 45 42 41 40 39 36 34
    35 33 32 30 29 28 27
    66 69 70 72 73 74 76 77
    29 26 25 23 21
    87 86 83 82 80 77 74 71
    51 54 57 60 61 63 66
    95 94 91 89 87 84 82 80
    66 64 61 59 56 54 51 48
    49 51 54 56 58
    34 36 37 38 39 41
    20 23 25 28 29 30 32 34
    36 34 32 29 27 26 25 22
    27 24 22 21 18 15 12
    54 55 56 58 60 62 63 65
    88 87 84 82 79 76 73
    49 51 54 57 59 60 62
    65 64 61 58 57 55 52
    18 19 20 22 24 27 30
    44 42 39 36 33
    80 81 83 85 88 89 90
    72 70 67 64 62 60
    45 47 50 52 54 57 59 62
    19 22 23 26 29 30 33 34
    69 71 72 75 76 77 80
    36 33 31 30 29 28 26 25
    19 16 13 11 9 7
    34 32 30 27 24 23
    23 20 18 17 14 11
    90 91 94 95 98
    24 23 21 20 17 14
    4 7 9 11 14 17
    9 10 12 13 15 18
    52 50 49 47 44 42 39
    20 23 24 26 27 28 29 31
    68 65 62 59 56 54 53 52
    76 73 70 67 64 61 59
    99 98 97 94 93 92 90 89
    32 29 26 25 24
    79 81 83 86 89 90 93 95
    50 48 46 45 43 41 38
    38 39 41 43 46 48
    4 6 8 10 13 14
    20 17 16 15 12 10 8
    35 32 31 30 27 24
    71 68 66 63 61 60 57
    69 72 74 77 79
    46 49 52 55 57 59 62
    24 22 21 19 18
    31 29 28 26 24
    58 60 61 64 66
    76 75 74 73 72 69 67 64
    36 39 41 42 43 46 47 50
    14 11 9 7 6 3
    2 3 4 5 8 10
    73 72 69 67 65 63 61 59
    31 29 27 25 22 21 19
    67 65 62 60 59 57 55
    32 35 37 38 39
    24 23 20 17 16 15 13 12
    60 61 62 65 66
    51 52 54 55 58
    75 72 70 68 66 64 62
    22 25 26 27 28 30 32 35
    95 94 91 88 86 84
    55 57 59 60 63 64
    70 69 68 66 63 62
    21 22 25 26 28 31 33
    11 14 17 19 22 23 26
    72 75 77 79 80 82 85
    32 29 26 24 23
    38 39 40 41 42 43 46 49
    26 24 21 20 17 16 14 13
    65 64 63 62 60
    72 69 68 67 64 63 62
    32 34 37 38 41
    15 12 11 8 7 6 4 3
    26 28 31 33 34 36 38 41
    75 76 79 81 84 85 86
    69 72 75 76 79 81 84
    51 53 54 56 59 61
    88 91 93 95 97 98
    57 56 53 51 49
    62 59 57 56 53 51 50 47
    84 87 89 90 91 94
    69 72 74 77 78 80 81
    15 17 19 22 23 25 26
    6 8 11 12 13 16
    44 42 40 39 37 35 34
    3 6 9 10 11 12
    20 19 18 17 14 11 10 9
    26 23 21 19 16
    90 91 93 94 97
    74 72 70 68 67 65 63
    61 60 57 54 52
    69 66 65 63 62
    30 29 27 26 23 20 18
    27 28 31 32 35
    51 52 53 56 59 62 65 68
    85 82 81 80 78 77 74 73
    37 34 33 32 30 29 28
    86 87 88 91 92 95 96
    72 71 69 68 66 64
    43 46 47 49 52 53 56 59
    87 84 83 81 78 76 75 73
    2 5 8 10 13 16 19 22
    75 74 71 69 67 64 61 58
    62 63 66 69 71
    23 21 18 16 13
    75 72 71 68 66 63 61 58
    61 58 55 52 50 48 45
    13 10 7 5 2 1
    81 82 83 84 86 89 92 94
    46 43 42 41 38 37
    18 16 15 14 11 9
    35 33 31 30 29
    7 9 10 11 13 15
    33 35 38 41 42 45 46 49
    85 87 88 90 92
    71 68 66 65 64
    21 23 25 28 29 32 33 35
    28 25 23 22 20 17
    16 15 12 11 8 6 5 4
    97 96 93 92 89 86 85 82
    28 26 23 22 21 20 18 15
    44 45 46 47 48
    45 43 42 40 39 38 37
    39 40 41 44 47 49
    58 57 56 54 52
    75 76 77 78 79 82 85
    57 60 62 65 68
    22 23 24 26 28 30 32 35
    51 52 53 55 57 58 60 63
    57 54 51 48 45 42 41 39
    84 83 82 81 78 75 74 73
    99 98 95 93 92 90
    42 39 36 33 31 29 27
    94 92 89 87 84 81 80 79
    23 26 28 30 31 32 33 34
    24 23 22 19 18 16 14 11
    64 62 61 58 56 53 51
    35 38 40 42 43
    43 46 47 48 50 53 55 58
    59 57 56 54 53 51
    40 42 43 45 48 50 53
    97 96 94 92 89 87
    74 72 69 66 63
    64 66 68 69 72 75 78 81
    41 44 45 46 48 50 53 55
    54 53 51 49 47 44 43 40
    20 18 17 14 12 11
    10 9 8 5 4 1
    74 73 71 70 67 66
    26 24 23 21 19 16 15
    86 87 90 92 94
    87 84 82 79 78
    8 6 4 2 1
    57 60 61 64 67
    19 22 24 26 28
    2 5 8 11 14 15 18
    77 74 71 68 66
    2 3 4 5 6 9 12 14
    92 90 88 86 84 81 79
    12 9 7 6 5
    9 12 13 14 16
    58 60 61 64 66 68 69 72
    84 86 87 89 90
    83 85 88 89 90 93 95
    89 86 84 81 80 77
    80 83 84 85 87
    65 62 60 57 56
    70 68 67 64 62 59 56
    54 51 49 47 44 42 40 37
    16 15 13 11 8
    66 65 62 60 58 56
    71 70 69 66 64 61
    55 57 59 60 62
    7 9 12 15 18
    52 50 47 44 41 38 36 34
    11 14 17 19 21
    27 25 22 21 19 17 15 14
    68 65 63 60 57 55 54
    58 57 56 53 51 50
    62 60 58 57 55
    52 53 56 57 58 59 60
    67 70 71 72 74 76 77 79
    79 76 73 72 69 67 65
    12 15 16 19 21 24 26
    69 66 64 63 61
    50 48 47 45 44 42 40 38
    21 19 17 15 12 11
    32 30 27 26 25 23 21 19
    37 35 32 30 29 27
    41 43 46 49 51 52 53 55
    20 23 25 27 30 32
    87 85 84 82 80 78 75 74
    26 28 30 31 34 37 39 42
    82 81 80 77 75
    35 33 30 27 25 24 21 20
    45 46 49 50 53
    59 57 55 52 49 48 47
    92 89 87 86 83 80 77 75
    94 91 88 86 85 83
    50 49 47 45 42 39 38 36
    65 62 60 57 55 54 52
    63 64 65 68 70 72 73 76
    27 24 22 20 17 14 13
    28 25 23 21 20
    28 31 34 35 38 41 44 46
    44 46 48 51 53 54 57 60
    24 21 19 18 15 13
    67 65 62 60 57
    10 8 7 4 2
    50 49 47 45 44
    62 64 67 70 71 72
    64 67 69 72 73 75 77
    23 26 27 28 29 32
    30 27 24 23 21 18 16
    87 90 91 92 93 94 96
    5 7 10 13 15
    38 35 32 30 28 27 26
    74 77 79 80 82
    66 64 63 60 57 56 55
    87 84 83 82 81 78 77
    85 87 90 93 95 96 98
    20 22 25 27 29 31
    40 38 35 32 31 30 29 27
    14 11 9 6 3
    87 85 83 80 77 74 73 70
    95 92 91 88 85 83 82 79
    41 42 44 45 46 48 51 53
    40 39 36 33 32 31 29
    27 26 23 22 21
    89 87 86 83 82 80 77
    66 63 62 61 60
    29 27 26 23 21 18
    24 26 29 31 32 34 37 39
    29 31 33 36 38 39 42 43
    15 18 19 22 25 28 31 32
    16 17 20 22 23 25 27 30
    33 30 29 26 23 21
    57 59 62 63 65
    17 14 13 12 10 7 4
    40 37 36 33 31 28 25 24
    70 69 67 66 63 61
    47 48 51 52 55
    10 9 6 4 2
    63 65 66 69 72 74 77 80
    30 29 26 23 20 17 16 14
    91 88 85 84 81 78 75 72
    80 78 76 74 72
    94 96 97 98 99
    35 33 32 29 27 26 24
    11 14 17 19 20 22 25 28
    58 60 63 64 66 67
    83 80 78 76 75 73
    54 52 49 48 47 45
    57 56 54 52 51 49 47
    58 60 62 65 68
    46 44 41 39 37
    16 17 18 19 20
    77 78 79 82 85
    49 47 44 43 41
    93 94 95 97 98
    87 86 83 81 80 78 77 76
    50 51 53 55 58
    97 94 91 88 87 86
    2 5 8 11 13 14 15
    20 21 23 26 28
    95 94 91 89 87 86 84
    25 22 20 18 17 14 12
    70 67 65 62 59 57 56
    71 72 75 76 79 81 82
    15 18 21 22 25 27
    39 41 42 43 46 48 51
    46 48 51 52 53 55
    35 38 40 43 45
    56 58 60 61 63 66 69
    37 35 33 32 31 29 26
    40 43 44 47 49 51
    64 62 61 58 56
    """
}

enum ExecutionPart {
    case part1
    case part2
}
