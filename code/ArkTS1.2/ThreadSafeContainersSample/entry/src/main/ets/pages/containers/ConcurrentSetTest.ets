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

function addData1(setInt: containers.ConcurrentSet<number>, logs: Array<string>) {
  for (let i = 0; i < 100; i++) {
    setInt.add(i);
    logs.push(`add: ${i}`);
  }
}

function addData2(setInt: containers.ConcurrentSet<number>, logs: Array<string>) {
  for (let i = 100; i < 200; i++) {
    setInt.add(i);
    logs.push(`add: ${i}`);
  }
}

function deleteData1(setInt: containers.ConcurrentSet<number>, logs: Array<string>) {
  for (let i = 0; i < 100; i++) {
    let isDelete = setInt.delete(i);
    if (isDelete) {
      logs.push(`delete: ${i}`);
    } else {
      logs.push(`删除失败`);
    }
  }
}

function deleteData2(setInt: containers.ConcurrentSet<number>, logs: Array<string>) {
  for (let i = 100; i < 200; i++) {
    let isDelete = setInt.delete(i);
    if (isDelete) {
      logs.push(`delete: ${i}`);
    } else {
      logs.push(`删除失败`);
    }
  }
}

export class ConcurrentSetTest {
  basicScene(): Array<string> {
    let setInt: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>();
    let logs: string[] = new Array<string>();
    for (let i = 0; i < 10; i++) {
      setInt.add(i);
      logs.push(`add: ${i}`);
    }
    logs.push(`当前集合: ${setInt}`);
    let zero = 1;
    let isHas = setInt.has(zero);
    if (isHas) {
      logs.push(`集合存在数据${zero}`);
    }
    const size = setInt.size;
    logs.push(`size: ${size}`);
    let isDelete = setInt.delete(2);
    logs.push(`delete: 2 删除是否成功: ${isDelete}`);
    logs.push(`当前集合: ${setInt}`);
    let keys = setInt.keys();
    let keyStr = '';
    while (true) {
      const v = keys.next()
      if (v.done) {
        break;
      }
      let value = v.value;
      keyStr += value + ' ';
    }
    ;
    logs.push(`keys: ${keyStr}`);
    let values = setInt.values();
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
    logs.push(`当前集合: ${setInt}`);
    setInt.clear();
    const setSize = setInt.size;
    logs.push(`清空集合后size: ${setSize}`);
    hilog.info(0x0000, 'testTag', 'ConcurrentSet  basicScene ' + logs);
    return logs;
  }

  concurrentInSet(): Array<string> {
    const setCapacity = 200;
    let set: Set<number> = new Set<number>();
    let setInt: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(set);
    let logs:  string[] = new Array<string>();
    let task1: taskpool.Task = new taskpool.Task(addData1, setInt, logs);
    let task2: taskpool.Task = new taskpool.Task(addData2, setInt, logs);
    let t1 = taskpool.execute(task1);
    let t2 = taskpool.execute(task2);
    await t1;
    await t2;
    const setSize = setInt.size;
    if (setCapacity === setSize) {
      logs.push('测试成功');
    }
    hilog.info(0x0000, 'testTag', 'ConcurrentSet  concurrentInSet ' + logs);
    return logs;
  }

  concurrentOutSet(): Array<string> {
    const setCapacity = 200;
    let set: Set<number> = new Set<number>();
    for (let i: number = 0; i < setCapacity; i++) {
      set.add(i);
    }
    let setInt: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(set);
    let logs:  string[] = new Array<string>();
    let task1: taskpool.Task = new taskpool.Task(deleteData1, setInt, logs);
    let task2: taskpool.Task = new taskpool.Task(deleteData2, setInt, logs);
    let t1 = taskpool.execute(task1);
    let t2 = taskpool.execute(task2);
    await t1;
    await t2;
    if (setInt.size === 0) {
      logs.push('测试成功');
    }
    hilog.info(0x0000, 'testTag', 'ConcurrentSet  concurrentOutSet ' + logs);
    return logs
  }
}