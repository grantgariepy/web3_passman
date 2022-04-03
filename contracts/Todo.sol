pragma solidity ^0.8.9;

contract Todo {
    struct Task {
    uint id;
    uint date;
    string content;
    string author;
    string password;
    bool done;
    uint dateComplete;
    }
    mapping(uint => Task) public tasks;
    uint nextTaskId;

    event TaskCreated(
        uint id,
        uint date,
        string content,
        string author,
        string password,
        bool done
    );
    event TaskStatusToggled(
        uint id,
        bool done,
        uint date
    );

    function createTask(
        string memory _content,
        string memory _author,
        string memory _password)
        external {
        tasks[nextTaskId] = Task(nextTaskId, block.timestamp, _content, _author, _password, false, 0);
        emit TaskCreated(nextTaskId, block.timestamp, _content, _author, _password, false);
        nextTaskId++;
    }

    function getTasks() external view returns(Task[] memory) {
        Task[] memory _tasks = new Task[](nextTaskId);
        for(uint i = 0; i < nextTaskId; i++) {
            _tasks[i] = tasks[i];
        }
        return _tasks;
    }

    function toggleDone(uint id) external {
        require(tasks[id].date != 0, 'task does not exist');
        Task storage task = tasks[id];
        task.done = !task.done;
        task.dateComplete = task.done ? block.timestamp : 0;
        emit TaskStatusToggled(id, task.done, task.dateComplete);
    }
}
