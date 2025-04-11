import hilog from '@ohos.hilog';

const MAP_CAPACITY: number = 100;

function setData1(map: ConcurrentHashMap<number, string>, logs: Array<string>) {
  for (let i = 0; i < 50; i++) {
    map.set(i, `v${i}`);
    logs.push(`set key: ${i} value: v${i}`);
  }
}

function setData2(map: ConcurrentHashMap<number, string>, logs: Array<string>) {
  for (let i = 50; i < 100; i++) {
    map.set(i, `v${i}`);
    logs.push(`set key: ${i} value: v${i}`);
  }
}

function deleteData1(map: ConcurrentHashMap<number, string>, logs: Array<string>) {
  for (let i = 0; i < 50; i++) {
    let isDelete = map.delete(i);
    if (isDelete) {
      logs.push(`delete key: ${i} 成功`);
    }
  }
}

function deleteData2(map: ConcurrentHashMap<number, string>, logs: Array<string>) {
  for (let i = 50; i < 100; i++) {
    let isDelete = map.delete(i);
    if (isDelete) {
      logs.push(`delete key: ${i} 成功`);
    }
  }
}

function setLargeData(map: ConcurrentHashMap<number, string>, logs: ArrayBlockingQueue<string>, quantity: number) {
  for (let i = quantity; i < quantity * 2; i++) {
    map.set(i, `v${i}`);
    logs.push(`set key: ${i} value: v${i}`);
  }
}

function getLargeData(map: ConcurrentHashMap<number, string>, logs: ArrayBlockingQueue<string>, quantity: number) {
  for (let i = quantity; i < quantity * 2; i++) {
    let getData = map.get(i);
    logs.push(`get key: ${i} value: ${getData}`);
  }
}

export class ConcurrentHashMapTest {
  basicScene() {
    let hashMapInt: ConcurrentHashMap<number, string> = new ConcurrentHashMap<number, string>();
    let logs: Array<string> = new Array<string>();
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
    }
    ;
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
    }
    ;
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
    }
    ;
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
  }

  concurrentInQueue() {
    let hashMapInt: ConcurrentHashMap<number, string> = new ConcurrentHashMap<number, string>();
    let logs: Array<string> = new Array<string>();
    let p1 = launch
    setData1(hashMapInt, logs);
    let p2 = launch
    setData2(hashMapInt, logs);
    await p1;
    await p2;
    const mapSize = hashMapInt.size;
    if (MAP_CAPACITY === mapSize) {
      logs.push('测试成功');
    }
    hilog.info(0x0000, 'testTag', 'ConcurrentHashMap concurrentInQueue ' + logs);
  }

  concurrentOutQueue() {
    let hashMapInt: ConcurrentHashMap<number, string> = new ConcurrentHashMap<number, string>();
    let logs: Array<string> = new Array<string>();
    for (let i = 0; i < MAP_CAPACITY; i++) {
      hashMapInt.set(i, `v${i}`);
    }
    let p1 = launch
    deleteData1(hashMapInt, logs);
    let p2 = launch
    deleteData2(hashMapInt, logs);
    await p1;
    await p2;
    const isEmpty = hashMapInt.isEmpty();
    if (isEmpty) {
      logs.push('测试成功');
    }
    hilog.info(0x0000, 'testTag', 'ConcurrentHashMap concurrentOutQueue ' + logs);
  }

  hashMapBenchmark() {
    const startTime = new Date().getTime();
    let hashMapInt: ConcurrentHashMap<number, string> = new ConcurrentHashMap<number, string>();
    let logs: ArrayBlockingQueue<string> = new ArrayBlockingQueue<string>(2801);
    let p1 = launch
    setLargeData(hashMapInt, logs, 200);
    let p2 = launch
    setLargeData(hashMapInt, logs, 400);
    let p3 = launch
    setLargeData(hashMapInt, logs, 800);
    let p4 = launch
    getLargeData(hashMapInt, logs, 200);
    let p5 = launch
    getLargeData(hashMapInt, logs, 400);
    let p6 = launch
    getLargeData(hashMapInt, logs, 800);
    await p1;
    await p2;
    await p3;
    await p4;
    await p5;
    await p6;

    const duration = new Date().getTime() - startTime;
    if (hashMapInt.size === 1400) {
      logs.push(`测试成功 吞吐量: 6 tasks in ${duration}ms`);
    }
    hilog.info(0x0000, 'testTag', 'ConcurrentHashMap hashMapBenchmark ' + logs.getEnd());
  }
}