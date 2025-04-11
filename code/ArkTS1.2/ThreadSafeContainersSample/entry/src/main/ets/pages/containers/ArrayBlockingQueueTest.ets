import hilog from '@ohos.hilog';

function pushData1(queue: ArrayBlockingQueue<int>, logs: Array<string>) {
  for (let i: int = 0; i < 100; i++) {
    queue.push(i);
    logs.push(`push: ${i}`);
  }
}

function pushData2(queue: ArrayBlockingQueue<int>, logs: Array<string>) {
  for (let i: int = 100; i < 200; i++) {
    queue.push(i);
    logs.push(`push: ${i}`);
  }
}

function popData1(queue: ArrayBlockingQueue<int>, logs: Array<string>) {
  for (let i = 0; i < 100; i++) {
    queue.pop();
    logs.push(`pop: ${i}`);
  }
}

function popData2(queue: ArrayBlockingQueue<int>, logs: Array<string>) {
  for (let i = 100; i < 200; i++) {
    queue.pop();
    logs.push(`pop: ${i}`);
  }
}

function nullBlockingPop(queue: ArrayBlockingQueue<int>, logs: Array<string>) {
  for (let i = 0; i < 3; i++) {
    logs.push(`pop: ${i}`);
    queue.pop();
    logs.push(`删除${i}成功 `);
  }
}

function nullBlockingPush(queue: ArrayBlockingQueue<int>, logs: Array<string>) {
  for (let i = 0; i < 3; i++) {
    logs.push(`push: ${i}`);
    queue.push(i);
    logs.push(`添加${i}成功 `);
  }
}

export class ArrayBlockingQueueTest {
  basicScene() {
    const queueCapacity: int = 10;
    let queueInt: ArrayBlockingQueue<int> = new ArrayBlockingQueue<int>(queueCapacity);
    let logs: Array<string> = new Array<string>();
    for (let i: int = 0; i < queueCapacity; i++) {
      queueInt.push(i);
      logs.push(`push: ${i}`);
    }
    const firstData = queueInt.getFirst();
    logs.push(`getFirst: ${firstData}`);
    const endData = queueInt.getEnd();
    logs.push(`getEnd: ${endData}`);
    const popData = queueInt.pop();
    logs.push(`pop: ${popData}`);
    const queueSize = queueInt.size;
    logs.push(`size: ${queueSize}`);
    const isEmpty = queueInt.isEmpty();
    logs.push(`isEmpty: ${isEmpty}`);
    hilog.info(0x0000, 'testTag', 'ArrayBlockingQueue basicScene ' + logs);
  }

  concurrentInQueue() {
    const queueCapacity: int = 200;
    let queueInt: ArrayBlockingQueue<int> = new ArrayBlockingQueue<int>(queueCapacity);
    let logs: Array<string> = new Array<string>();
    let p1 = launch
    pushData1(queueInt, logs);
    let p2 = launch
    pushData2(queueInt, logs);
    await p1;
    await p2;
    const queueSize = queueInt.size;
    if (queueCapacity === queueSize) {
      logs.push('测试成功');
    }
    hilog.info(0x0000, 'testTag', 'ArrayBlockingQueue concurrentInQueue ' + logs);
  }

  concurrentOutQueue() {
    const queueCapacity = 200;
    let queueInt: ArrayBlockingQueue<int> = new ArrayBlockingQueue<int>(queueCapacity);
    let logs: Array<string> = new Array<string>();
    for (let i: int = 0; i < queueCapacity; i++) {
      queueInt.push(i);
    }
    let p1 = launch
    popData1(queueInt, logs);
    let p2 = launch
    popData2(queueInt, logs);
    await p1;
    await p2;
    const isEmpty = queueInt.isEmpty();
    if (isEmpty) {
      logs.push('测试成功');
    }
    hilog.info(0x0000, 'testTag', 'ArrayBlockingQueue concurrentOutQueue ' + logs);
  }

  nullBlocking() {
    const queueCapacity = 3;
    let queueInt: ArrayBlockingQueue<int> = new ArrayBlockingQueue<int>(queueCapacity);
    let logs: Array<string> = new Array<string>();
    let p1 = launch
    nullBlockingPop(queueInt, logs);
    let p2 = launch
    nullBlockingPush(queueInt, logs);
    await p1;
    await p2;
    hilog.info(0x0000, 'testTag', 'ArrayBlockingQueue nullBlocking ' + logs);
  }
}