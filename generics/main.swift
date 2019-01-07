let oddNumbers = [1, 3, 5, 7, 9, 11, 13, 15]

let inj = oddNumbers.inj()

extension App1 where T == ArrayConstructor {
    func length() -> Int {
        let a = self.prj()
        return a.count
    }
}

print(inj.length())
