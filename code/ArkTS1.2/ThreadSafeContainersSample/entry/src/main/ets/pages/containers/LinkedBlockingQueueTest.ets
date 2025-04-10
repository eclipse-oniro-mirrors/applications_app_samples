import hilog from '@ohos.hilog';

function pushData1(queue: LinkedBlockingQueue<int>, logs: Array<string>) {
  for (let i = 0; i < 100; i++) {
    queue.push(i);
    logs.push(`push: ${i}`);
  }
}

function pushData2(queue: LinkedBlockingQueue<int>, logs: Array<string>) {
  for (let i = 100; i < 200; i++) {
    queue.push(i);
    logs.push(`push: ${i}`);
  }
}

function popData1(queue: LinkedBlockingQueue<int>, logs: Array<string>) {
  for (let i = 0; i < 100; i++) {
    queue.pop();
    logs.push(`pop: ${i}`);
  }
}

function popData2(queue: LinkedBlockingQueue<int>, logs: Array<string>) {
  for (let i = 100; i < 200; i++) {
    queue.pop();
    logs.push(`pop: ${i}`);
  }
}

function fullBlockingPush(queue: LinkedBlockingQueue<int>, logs: Array<string>) {
  for (let i = 0; i < 3; i++) {
    logs.push(`push: ${i}`);
    queue.push(i);
    logs.push(`添加${i}成功 `);
  }
}

function fullBlockingPop(queue: LinkedBlockingQueue<int>, logs: Array<string>) {
  for (let i = 0; i < 6; i++) {
    logs.push(`pop: ${i}`);
    queue.pop();
    logs.push(`删除${i}成功 `);
  }
}

function nullBlockingPop(queue: LinkedBlockingQueue<int>, logs: Array<string>) {
  for (let i = 0; i < 3; i++) {
    logs.push(`pop: ${i}`);
    queue.pop();
    logs.push(`删除${i}成功 `);
  }
}

function nullBlockingPush(queue: LinkedBlockingQueue<int>, logs: Array<string>) {
  for (let i = 0; i < 3; i++) {
    logs.push(`push: ${i}`);
    queue.push(i);
    logs.push(`添加${i}成功 `);
  }
}

export class LinkedBlockingQueueTest {
  basicScene() {
    const queue = 10;
    let queueInt: LinkedBlockingQueue<int> = new LinkedBlockingQueue<int>(queue);
    let logs: Array<string> = new Array<string>();
    const capacity = queueInt.capacity;
    logs.push(`队列capacity: ${capacity}`);
    for (let i = 0; i < queue; i++) {
      queueInt.push(i);
      logs.push(`push: ${i}`);
    }
    const popData = queueInt.pop();
    logs.push(`pop: ${popData}`);
    const addData = 10;
    queueInt.add(addData);
    logs.push(`add: ${addData}`);
    const pollData = queueInt.poll();
    logs.push(`poll: ${pollData}`);
    const size = queueInt.size;
    logs.push(`size: ${size}`);
    const remainingCapacity = queueInt.remainingCapacity();
    logs.push(`remainingCapacity: ${remainingCapacity}`);

    hilog.info(0x0000, 'testTag', 'LinkedBlockingQueueTest basicScene ' + logs);
  }

  concurrentInQueue() {
    const queueCapacity = 200;
    let queueInt: LinkedBlockingQueue<int> = new LinkedBlockingQueue<int>(queueCapacity);
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
    hilog.info(0x0000, 'testTag', 'LinkedBlockingQueueTest concurrentInQueue ' + logs);
  }

  concurrentOutQueue() {
    const queueCapacity = 200;
    let queueInt: LinkedBlockingQueue<int> = new LinkedBlockingQueue<int>(queueCapacity);
    let logs: Array<string> = new Array<string>();
    for (let i = 0; i < queueCapacity; i++) {
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
    hilog.info(0x0000, 'testTag', 'LinkedBlockingQueueTest concurrentOutQueue ' + logs);
  }

  fullBlocking() {
    const queueCapacity = 3;
    let queueInt: LinkedBlockingQueue<int> = new LinkedBlockingQueue<int>(queueCapacity);
    let logs: Array<string> = new Array<string>();
    for (let i = 0; i < queueCapacity; i++) {
      queueInt.push(i);
    }
    let p1 = launch
    fullBlockingPush(queueInt, logs);
    let p2 = launch
    fullBlockingPop(queueInt, logs);
    await p1;
    await p2;
    hilog.info(0x0000, 'testTag', 'LinkedBlockingQueueTest fullBlocking ' + logs);
  }

  nullBlocking() {
    const queueCapacity = 3;
    let queueInt: LinkedBlockingQueue<int> = new LinkedBlockingQueue<int>(queueCapacity);
    let logs: Array<string> = new Array<string>();
    let p1 = launch
    nullBlockingPop(queueInt, logs);
    let p2 = launch
    nullBlockingPush(queueInt, logs);
    await p1;
    await p2;
    hilog.info(0x0000, 'testTag', 'LinkedBlockingQueueTest nullBlocking ' + logs);
  }
}