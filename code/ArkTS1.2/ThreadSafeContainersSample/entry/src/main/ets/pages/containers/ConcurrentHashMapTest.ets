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

import {
  Text,
  TextAttribute,
  Column,
  Component,
  Button,
  ButtonAttribute,
  ClickEvent
} from '@ohos.arkui.component';
import {
  State
} from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog';

const MAP_CAPACITY: number = 100;

function setData1(map: containers.ConcurrentHashMap<number, string>, logs: Array<string>) {
  for (let i = 0; i < 50; i++) {
    map.set(i, `v${i}`);
    logs.push(`set key: ${i} value: v${i}`);
  }
}

function setData2(map: containers.ConcurrentHashMap<number, string>, logs: Array<string>) {
  for (let i = 50; i < 100; i++) {
    map.set(i, `v${i}`);
    logs.push(`set key: ${i} value: v${i}`);
  }
}

function deleteData1(map: containers.ConcurrentHashMap<number, string>, logs: Array<string>) {
  for (let i = 0; i < 50; i++) {
    let isDelete = map.delete(i);
    if (isDelete) {
      logs.push(`delete key: ${i} 成功`);
    }
  }
}

function deleteData2(map: containers.ConcurrentHashMap<number, string>, logs: Array<string>) {
  for (let i = 50; i < 100; i++) {
    let isDelete = map.delete(i);
    if (isDelete) {
      logs.push(`delete key: ${i} 成功`);
    }
  }
}

function setLargeData1(map: containers.ConcurrentHashMap<number, string>, logs: containers.ArrayBlockingQueue<string>) {
  for (let i = 200; i < 400; i++) {
    map.set(i, `v${i}`);
    logs.push(`set key: ${i} value: v${i}`);
  }
}

function setLargeData2(map: containers.ConcurrentHashMap<number, string>, logs: containers.ArrayBlockingQueue<string>) {
  for (let i = 400; i < 800; i++) {
    map.set(i, `v${i}`);
    logs.push(`set key: ${i} value: v${i}`);
  }
}

function setLargeData3(map: containers.ConcurrentHashMap<number, string>, logs: containers.ArrayBlockingQueue<string>) {
  for (let i = 800; i < 1600; i++) {
    map.set(i, `v${i}`);
    logs.push(`set key: ${i} value: v${i}`);
  }
}

function getLargeData1(map: containers.ConcurrentHashMap<number, string>, logs: containers.ArrayBlockingQueue<string>) {
  for (let i = 200; i < 400; i++) {
    let getData = map.get(i);
    logs.push(`get key: ${i} value: ${getData}`);
  }
}

function getLargeData2(map: containers.ConcurrentHashMap<number, string>, logs: containers.ArrayBlockingQueue<string>) {
  for (let i = 200; i < 400; i++) {
    let getData = map.get(i);
    logs.push(`get key: ${i} value: ${getData}`);
  }
}

function getLargeData3(map: containers.ConcurrentHashMap<number, string>, logs: containers.ArrayBlockingQueue<string>) {
  for (let i = 200; i < 400; i++) {
    let getData = map.get(i);
    logs.push(`get key: ${i} value: ${getData}`);
  }
}

export class ConcurrentHashMapTest {
  basicScene(): Array<string> {
    let hashMapInt: containers.ConcurrentHashMap<number, string> = new containers.ConcurrentHashMap<number, string>();
    let logs: string[] = new Array<string>();
    for (let i = 0; i < 10; i++) {
      hashMapInt.set(i, `v${i}`);
      logs.push(`set: k${i}, v${i}`);
    }
    logs.push(`当前map: ${hashMapInt}`);
    const getKey = 1;
    const getData = hashMapInt.get(1);
    logs.push(`get key=: ${getKey} value=: ${getData}`);
    const hasKey = 2;
    let isHas = hashMapInt.has(2);
    logs.push(`key: ${hasKey} 是否存在： ${isHas}`);
    const keys = hashMapInt.keys();
    let keysStr = '';
    while (true) {
      const v = keys.next()
      if (v.done) {
        break;
      }
      let value = v.value;
      keysStr += value + ' ';
    };
    logs.push(`keys: ${keysStr}`);
    const values = hashMapInt.values();
    let valuesStr = '';
    while (true) {
      const v = values.next()
      if (v.done) {
        break;
      }
      let value = v.value;
      valuesStr += value + ' ';
    };
    logs.push(`values: ${valuesStr}`);
    const entries = hashMapInt.entries();
    let entriesStr = '';
    while (true) {
      const v = entries.next()
      if (v.done) {
        break;
      }
      let value = v.value;
      entriesStr += value + ' ';
    };
    logs.push(`entries: ${entriesStr}`);
    const deleteKey = 3;
    const isDelete = hashMapInt.delete(3);
    if (isDelete) {
      logs.push(`delete key= ${deleteKey}，删除成功`);
    } else {
      logs.push(`delete key= ${deleteKey}，删除失败`);
    }
    const removeKey = 4;
    let isRemove = hashMapInt.remove(4);
    if (isRemove) {
      logs.push(`remove key= ${removeKey}，移除成功`);
    } else {
      logs.push(`remove key= ${removeKey}，移除失败`);
    }
    const replaceKey = 5;
    const isReplace = hashMapInt.replace(5, 'five');
    if (isReplace) {
      logs.push(`replace key= ${replaceKey}，替换成功`);
    } else {
      logs.push(`replace key= ${replaceKey}，替换失败`);
    }
    hashMapInt.clear();
    const isEmpty = hashMapInt.isEmpty();
    const mapSize = hashMapInt.size;
    if (isEmpty) {
      logs.push(`hashMapInt通过clear方法清空，hashMapInt.size = ${mapSize} `);
    }
    hilog.info(0x0000, 'testTag', 'ConcurrentHashMap basicScene ' + logs);
    return logs;
  }

  concurrentInQueue(): Array<string> {
    let hashMapInt: containers.ConcurrentHashMap<number, string> = new containers.ConcurrentHashMap<number, string>();
    let logs:  string[] = new Array<string>();
    let task1: taskpool.Task = new taskpool.Task(setData1, hashMapInt, logs);
    let task2: taskpool.Task = new taskpool.Task(setData2, hashMapInt, logs);
    let t1 = taskpool.execute(task1);
    let t2 = taskpool.execute(task2);
    await t1;
    await t2;
    const mapSize = hashMapInt.size;
    if (MAP_CAPACITY === mapSize) {
      logs.push('测试成功');
    }
    hilog.info(0x0000, 'testTag', 'ConcurrentHashMap concurrentInQueue ' + logs);
    return logs;
  }

  concurrentOutQueue(): Array<string> {
    let hashMapInt: containers.ConcurrentHashMap<number, string> = new containers.ConcurrentHashMap<number, string>();
    let logs:   string[] = new Array<string>();
    for (let i = 0; i < MAP_CAPACITY; i++) {
      hashMapInt.set(i, `v${i}`);
    }
    let task1: taskpool.Task = new taskpool.Task(deleteData1, hashMapInt, logs);
    let task2: taskpool.Task = new taskpool.Task(deleteData2, hashMapInt, logs);
    let t1 = taskpool.execute(task1);
    let t2 = taskpool.execute(task2);
    await t1;
    await t2;
    const isEmpty = hashMapInt.isEmpty();
    if (isEmpty) {
      logs.push('测试成功');
    }
    hilog.info(0x0000, 'testTag', 'ConcurrentHashMap concurrentOutQueue ' + logs);
    return logs;
  }

  hashMapBenchmark(): string {
    const startTime = new Date().getTime();
    let hashMapInt: containers.ConcurrentHashMap<number, string> = new containers.ConcurrentHashMap<number, string>();
    let logs: containers.ArrayBlockingQueue<string> = new containers.ArrayBlockingQueue<string>(2801);
    let task1: taskpool.Task = new taskpool.Task(setLargeData1, hashMapInt, logs);
    let task2: taskpool.Task = new taskpool.Task(setLargeData2, hashMapInt, logs);
    let task3: taskpool.Task = new taskpool.Task(setLargeData3, hashMapInt, logs);
    let task4: taskpool.Task = new taskpool.Task(getLargeData1, hashMapInt, logs);
    let task5: taskpool.Task = new taskpool.Task(getLargeData2, hashMapInt, logs);
    let task6: taskpool.Task = new taskpool.Task(getLargeData3, hashMapInt, logs);
    let t1 = taskpool.execute(task1);
    let t2 = taskpool.execute(task2);
    let t3 = taskpool.execute(task3);
    let t4 = taskpool.execute(task4);
    let t5 = taskpool.execute(task5);
    let t6 = taskpool.execute(task6);
    await t1;
    await t2;
    await t3;
    await t4;
    await t5;
    await t6;
    const duration = new Date().getTime() - startTime;
    if (hashMapInt.size === 1400) {
      logs.push(`测试成功 吞吐量: 6 tasks in ${duration}ms`);
    }
    hilog.info(0x0000, 'testTag', 'ConcurrentHashMap hashMapBenchmark ' + logs);
    return String(logs.getEnd());
  }
}

