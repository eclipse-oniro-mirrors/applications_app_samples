import hilog from '@ohos.hilog';

function addData1(setInt: ConcurrentSet<number>, logs: Array<string>) {
  for (let i = 0; i < 100; i++) {
    setInt.add(i);
    logs.push(`add: ${i}`);
  }
}

function addData2(setInt: ConcurrentSet<number>, logs: Array<string>) {
  for (let i = 100; i < 200; i++) {
    setInt.add(i);
    logs.push(`add: ${i}`);
  }
}

function deleteData1(setInt: ConcurrentSet<number>, logs: Array<string>) {
  for (let i = 0; i < 100; i++) {
    let isDelete = setInt.delete(i);
    if (isDelete) {
      logs.push(`delete: ${i}`);
    } else {
      logs.push(`删除失败`);
    }
  }
}

function deleteData2(setInt: ConcurrentSet<number>, logs: Array<string>) {
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
  basicScene() {
    let setInt: ConcurrentSet<number> = new ConcurrentSet<number>();
    let logs: Array<string> = new Array<string>();
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
    }
    ;
    logs.push(`values: ${valuesStr}`);
    logs.push(`当前集合: ${setInt}`);
    setInt.clear();
    const setSize = setInt.size;
    logs.push(`清空集合后size: ${setSize}`);
    hilog.info(0x0000, 'testTag', 'ConcurrentSet  basicScene ' + logs);
  }

  concurrentInSet() {
    const setCapacity = 200;
    let set: Set<number> = new Set<number>();
    let setInt: ConcurrentSet<number> = new ConcurrentSet<number>(set);
    let logs: Array<string> = new Array<string>();
    let p1 = launch
    addData1(setInt, logs);
    let p2 = launch
    addData2(setInt, logs);
    await p1;
    await p2;
    const setSize = setInt.size;
    if (setCapacity === setSize) {
      logs.push('测试成功');
    }
    hilog.info(0x0000, 'testTag', 'ConcurrentSet  concurrentInSet ' + logs);
  }

  concurrentOutSet() {
    const setCapacity = 200;
    let set: Set<number> = new Set<number>();
    for (let i: number = 0; i < setCapacity; i++) {
      set.add(i);
    }
    let setInt: ConcurrentSet<number> = new ConcurrentSet<number>(set);
    let logs: Array<string> = new Array<string>();
    let p1 = launch
    deleteData1(setInt, logs);
    let p2 = launch
    deleteData2(setInt, logs);
    await p1;
    await p2;
    if (setInt.size === 0) {
      logs.push('测试成功');
    }
    hilog.info(0x0000, 'testTag', 'ConcurrentSet  concurrentOutSet ' + logs);
  }
}