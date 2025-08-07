/**
 *
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 *
 * All rights reserved.
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * Redistributions of source code must retain the above copyright notice,this
 * list of conditions and the following disclaimer.
 *
 * Redistributions in binary form must reproduce the above copyright notice,
 * this list of conditions and the following disclaimer in the documentation
 * and/or other materials provided with the distribution.
 *
 * THIS IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 'AS IS' AND ANY EXPRESS OR IMPLIED WARRANTIES,
 * INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
 * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS,
 *
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

import hilog from '@ohos.hilog';

function pushData1(queue: containers.LinkedBlockingQueue<int>, logs: Array<string>) {
  for (let i = 0; i < 100; i++) {
    queue.push(i);
    logs.push(`push: ${i}`);
  }
}

function pushData2(queue: containers.LinkedBlockingQueue<int>, logs: Array<string>) {
  for (let i = 100; i < 200; i++) {
    queue.push(i);
    logs.push(`push: ${i}`);
  }
}

function popData1(queue: containers.LinkedBlockingQueue<int>, logs: Array<string>) {
  for (let i = 0; i < 100; i++) {
    queue.pop();
    logs.push(`pop: ${i}`);
  }
}

function popData2(queue: containers.LinkedBlockingQueue<int>, logs: Array<string>) {
  for (let i = 100; i < 200; i++) {
    queue.pop();
    logs.push(`pop: ${i}`);
  }
}

function fullBlockingPush(queue: containers.LinkedBlockingQueue<int>, logs: Array<string>) {
  for (let i = 0; i < 3; i++) {
    logs.push(`push: ${i}`);
    queue.push(i);
    logs.push(`添加${i}成功 `);
  }
}

function fullBlockingPop(queue: containers.LinkedBlockingQueue<int>, logs: Array<string>) {
  for (let i = 0; i < 6; i++) {
    logs.push(`pop: ${i}`);
    queue.pop();
    logs.push(`删除${i}成功 `);
  }
}

function nullBlockingPop(queue: containers.LinkedBlockingQueue<int>, logs: Array<string>) {
  for (let i = 0; i < 3; i++) {
    logs.push(`pop: ${i}`);
    queue.pop();
    logs.push(`删除${i}成功 `);
  }
}

function nullBlockingPush(queue: containers.LinkedBlockingQueue<int>, logs: Array<string>) {
  for (let i = 0; i < 3; i++) {
    logs.push(`push: ${i}`);
    queue.push(i);
    logs.push(`添加${i}成功 `);
  }
}

export class LinkedBlockingQueueTest {
  basicScene(): Array<String> {
    const queue = 10;
    let queueInt: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(queue);
    let logs: string[] = new Array<string>();
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
    return logs;
  }

  concurrentInQueue(): Array<String> {
    const queueCapacity = 200;
    let queueInt: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(queueCapacity);
    let logs:  string[] = new Array<string>();
    let task1: taskpool.Task = new taskpool.Task(pushData1, queueInt, logs);
    let task2: taskpool.Task = new taskpool.Task(pushData2, queueInt, logs);
    let t1 = taskpool.execute(task1);
    let t2 = taskpool.execute(task2);
    await t1;
    await t2;
    const queueSize = queueInt.size;
    if (queueCapacity === queueSize) {
      logs.push('测试成功');
    }
    hilog.info(0x0000, 'testTag', 'LinkedBlockingQueueTest concurrentInQueue ' + logs);
    return logs;
  }

  concurrentOutQueue(): Array<String> {
    const queueCapacity = 200;
    let queueInt: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(queueCapacity);
    let logs: string[] = new Array<string>();
    for (let i = 0; i < queueCapacity; i++) {
      queueInt.push(i);
    }
    let task1: taskpool.Task = new taskpool.Task(popData1, queueInt, logs);
    let task2: taskpool.Task = new taskpool.Task(popData2, queueInt, logs);
    let t1 = taskpool.execute(task1);
    let t2 = taskpool.execute(task2);
    await t1;
    await t2;
    const isEmpty = queueInt.isEmpty();
    if (isEmpty) {
      logs.push('测试成功');
    }
    hilog.info(0x0000, 'testTag', 'LinkedBlockingQueueTest concurrentOutQueue ' + logs);
    return logs;
  }

  fullBlocking(): Array<String> {
    const queueCapacity = 3;
    let queueInt: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(queueCapacity);
    let logs: string[] = new Array<string>();
    for (let i = 0; i < queueCapacity; i++) {
      queueInt.push(i);
    }
    let task1: taskpool.Task = new taskpool.Task(fullBlockingPush, queueInt, logs);
    let task2: taskpool.Task = new taskpool.Task(fullBlockingPop, queueInt, logs);
    let t1 = taskpool.execute(task1);
    let t2 = taskpool.execute(task2);
    await t1;
    await t2;
    hilog.info(0x0000, 'testTag', 'LinkedBlockingQueueTest fullBlocking ' + logs);
    return logs;
  }

  nullBlocking(): Array<String> {
    const queueCapacity = 3;
    let queueInt: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(queueCapacity);
    let logs:  string[] = new Array<string>();
    let task1: taskpool.Task = new taskpool.Task(nullBlockingPop, queueInt, logs);
    let task2: taskpool.Task = new taskpool.Task(nullBlockingPush, queueInt, logs);
    let t1 = taskpool.execute(task1);
    let t2 = taskpool.execute(task2);
    await t1;
    await t2;
    hilog.info(0x0000, 'testTag', 'LinkedBlockingQueueTest nullBlocking ' + logs);
    return logs;
  }
}