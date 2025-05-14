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
  memo,
  __memo_context_type,
  __memo_id_type
} from "@ohos.arkui.stateManagement" // should be insert by ui-plugins
import {
  Text,
  TextAttribute,
  Column,
  Component,
  Button,
  ButtonAttribute,
  ClickEvent,
  UserView,
  Row,$r
} from "@ohos.arkui.component" // TextAttribute should be insert by ui-plugins
import {
  State,
  StateDecoratedVariable,
  MutableState,
  stateOf,
  observableProxy
} from "@ohos.arkui.stateManagement" // should be insert by ui-plugins
import hilog from '@ohos.hilog'
import fs from '@ohos.file.fs'

let lockName = 'isAvailableLock';
let lockTest = AsyncLock.request(lockName);
let lockTest2 = new AsyncLock();
let lock = new AsyncLock();
let lock2 = new AsyncLock();
let lock3 = new AsyncLock();
let lockFile = new AsyncLock();
let mapTest: Map<int, string> = new Map<int, string>();
let lockTest3 = new AsyncLock();
const NUM_50 = 50;
const NUM_25 = 25;
const NUM_8 = 8;
const NUM_100 = 100;
const NUM_200 = 200;

function createFileTest(fileName: string, context: string): void {
  try {
    let res = fs.accessSync(fileName);
    let file = fs.openSync(fileName, 0o100 | 0o2);
    let byteNumber = fs.writeSync(file.fd, context);
    fs.closeSync(file.fd);
  } catch (e) {
    hilog.error(0x0000, 'testTag', 'openSync fail' + `${e}`);
  }
}

@Component
struct MyStateSample {
  @State stringTest1LockSame: string = "";
  @State stringTest1Unlock: string = "";
  @State messageString: string = "";
  @State messageStringUnlock: string = "";
  @State mapString: string = "";
  messageStringTmp: string = "";
  messageStringTmpUnlock: string = "";
  stringTest1TmpLockSame: string = "";
  stringTest1TmpUnlock: string = "";
  @State stringTest2: string = "";
  @State stringFile: string = "";
  @State priorityString: string = "";
  @State addString: string = " ";
  @State taskGroupString: string = " ";

  async readFile(fileName: string): Promise<void> {
    await lockFile.lockAsync(() => {
      try {
        let file = fs.openSync(fileName, 0o100 | 0o2);
        let result = fs.readTextSync(fileName);
        hilog.info(0x0000, 'testTag', 'foo file result ' + `${result}`);
        this.stringFile = JSON.stringify(result);
        fs.closeSync(file.fd);
      } catch (e) {
        hilog.error(0x0000, 'testTag', 'openSync fail' + `${e}`);
      }
    });
  }

  async fooTest(): Promise<void> {
    let p1 = await lockTest.lockAsync(() => {
      for (let i = 0; i < NUM_25; ++i) {
        this.stringTest1TmpLockSame += "1";
      }
    });
    this.stringTest1LockSame = this.stringTest1TmpLockSame;
  }

  async fooTest2(): Promise<void> {
    let p2 = await lockTest.lockAsync(() => {
      for (let i = 0; i < NUM_25; ++i) {
        this.stringTest1TmpLockSame += "2";
      }
    });
    this.stringTest1LockSame = this.stringTest1TmpLockSame;
  }

  async fooTest3(): Promise<void> {
    let p2 = await lockTest.lockAsync(() => {
      for (let i = 0; i < NUM_25; ++i) {
        this.stringTest1TmpLockSame += "3";
      }
    });
    this.stringTest1LockSame = this.stringTest1TmpLockSame;
  }

  fooTestUnlock(): void {
    for (let i = 0; i < NUM_25; ++i) {
      this.stringTest1TmpUnlock += "1";
    }
    this.stringTest1Unlock = this.stringTest1TmpUnlock;
  }

  fooTestUnlock2(): void {
    for (let i = 0; i < NUM_25; ++i) {
      this.stringTest1TmpUnlock += "2";
    }
    this.stringTest1Unlock = this.stringTest1TmpUnlock;
  }

  fooTestUnlock3(): void {
    for (let i = 0; i < NUM_25; ++i) {
      this.stringTest1TmpUnlock += "3";
    }
    this.stringTest1Unlock = this.stringTest1TmpUnlock;
  }

  foo(s: string): void {
    lock.lockAsync(() => {
      for (let i = 0; i < NUM_25; ++i) {
        this.messageStringTmp += s;
      }
    })
  }

  fooUnLock(s: string): void {
    for (let i = 0; i < NUM_50; ++i) {
      this.messageStringTmpUnlock += s;
    }
  }

  fooMapTest(): void {
    lockTest3.lockAsync(() => {
      for (let i = 0; i < NUM_100; ++i) {
        mapTest.set(i, "num " + i);
      }
    });
  }

  fooMapTest2(): void {
    lockTest3.lockAsync(() => {
      for (let i = 0; i < NUM_50; ++i) {
        if (mapTest.has(i)) {
          mapTest.delete(i);
        }
      }
    });
  }

  add(num1: int, num2: int): int {
    return num1 + num2;
  }

  concurrentFuncAdd() {
    const task = new taskpool.Task(this.add, 2, 10); // 2 10: test number
    taskpool.execute(task).then((value: NullishType) => {
      hilog.info(0x0000, 'testTag', 'taskpool ' + value);
      this.addString += JSON.stringify(value);
    });
  }

  args(args: int): int {
    return args;
  }

  taskTest() {
    let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
    taskGroup1.addTask(this.args, 10); // 10: test number
    taskGroup1.addTask(this.args, 20); // 20: test number
    taskGroup1.addTask(this.args, 30); // 30: test number

    let taskGroup2: taskpool.TaskGroup = new taskpool.TaskGroup();
    let task1: taskpool.Task = new taskpool.Task(this.args, 100); // 100: test number
    let task2: taskpool.Task = new taskpool.Task(this.args, 200); // NUM_200: test number
    let task3: taskpool.Task = new taskpool.Task(this.args, 300); // 300: test number
    taskGroup2.addTask(task1);
    taskGroup2.addTask(task2);
    taskGroup2.addTask(task3);

    taskpool.execute(taskGroup2).then((res: Array<NullishType>) => {
      hilog.info(0x0000, 'testTag', 'openSync fail' + res);
      this.taskGroupString += JSON.stringify(res);
    });

    taskpool.execute(taskGroup1).then((res: Array<NullishType>) => {
      hilog.info(0x0000, 'testTag', 'openSync fail' + res);
      this.taskGroupString += JSON.stringify(res);
    });
  }

  priorityLOW() {
    this.priorityString += "L";
  }

  priorityHIGH() {
    this.priorityString += "H";
  }

  priorityMEDIUM() {
    this.priorityString += "M";
  }

  concurrentFunc() {
    for (let i = 0; i < 10; ++i) {
      const task = new taskpool.Task(this.priorityHIGH)
      const task2 = new taskpool.Task(this.priorityMEDIUM)
      const task3 = new taskpool.Task(this.priorityLOW)
      taskpool.execute(task, taskpool.Priority.HIGH).then((value: NullishType) => {
        hilog.info(0x0000, 'testTag', 'taskpool ' + this.priorityString);
      });
      taskpool.execute(task2, taskpool.Priority.MEDIUM).then((value: NullishType) => {
        hilog.info(0x0000, 'testTag', 'taskpool ' + this.priorityString);
      });
      taskpool.execute(task3, taskpool.Priority.LOW).then((value: NullishType) => {
        hilog.info(0x0000, 'testTag', 'taskpool ' + this.priorityString);
      });
    }
  }

  build() {
    Column() {
      Column() {
        Text("-------------------EAWorker------------------").width("100%")
        Button($r('app.string.EAWorkerButtonTest'))
          .onClick((e: ClickEvent) => {
            let eaw: EAWorker = new EAWorker(true);
            let eaw2: EAWorker = new EAWorker(true);
            let eaw3: EAWorker = new EAWorker(true);
            eaw.run<void>(this.foo, "&");
            eaw2.run<void>(this.foo, "*");
            eaw3.run<void>(this.foo, "@");
            eaw.join();
            eaw2.join();
            eaw3.join();
            setTimeout(() => {
              hilog.info(0x0000, 'testTag', 'messageString' + this.messageStringTmp);
              this.messageString = this.messageStringTmp;
              this.messageStringTmp = " ";
            }, 100)
          })
          .borderRadius(NUM_8)
          .backgroundColor(0x317aff)
          .width("80%")
        Column() {
          Text($r('app.string.EAWorkerTextTest')).height(NUM_50)
          Text(this.messageStringUnlock).width("90%")
        }

         Button($r('app.string.EAWorkerButtonTest2'))
          .onClick((e: ClickEvent) => {
            let eaw: EAWorker = new EAWorker(true);
            let eaw2: EAWorker = new EAWorker(true);
            let eaw3: EAWorker = new EAWorker(true);
            eaw.run<void>(this.fooUnLock, "&");
            eaw2.run<void>(this.fooUnLock, "*");
            eaw3.run<void>(this.fooUnLock, "@");
            eaw.join();
            eaw2.join();
            eaw3.join();
            setTimeout(() => {
              this.messageStringUnlock = this.messageStringTmpUnlock;
              this.messageStringTmpUnlock = " ";
            }, 100)
          })
          .borderRadius(NUM_8)
          .backgroundColor(0x317aff)
          .width("80%")
        Column() {
          Text($r('app.string.EAWorkerTextTest2')).height(NUM_50)
          Text(this.messageStringUnlock).width("90%")
        }
      }.height(NUM_200)

      Column() {
        Button($r('app.string.EAWorkerButtonTest3'))
          .onClick((e: ClickEvent) => {
            let eaw: EAWorker = new EAWorker(true);
            let eaw2: EAWorker = new EAWorker(true);
            let eaw3: EAWorker = new EAWorker(true);
            eaw.run<void>(this.fooTest);
            eaw2.run<void>(this.fooTest2);
            eaw3.run<void>(this.fooTest3);
            eaw.join();
            eaw2.join();
            eaw3.join();
            this.stringTest1TmpLockSame = " ";
          })
          .borderRadius(NUM_8)
          .backgroundColor(0x317aff)
          .width("80%")
        Column() {
          Text($r('app.string.EAWorkerTextTest3')).height(NUM_50)
          Text(this.stringTest1LockSame).width("90%")
        }
      }.height(NUM_200)

      Column() {
        Button($r('app.string.EAWorkerButtonTest4'))
          .onClick((e: ClickEvent) => {
            let eaw: EAWorker = new EAWorker(true);
            let eaw2: EAWorker = new EAWorker(true);
            let eaw3: EAWorker = new EAWorker(true);
            eaw.run<void>(this.fooTestUnlock);
            eaw2.run<void>(this.fooTestUnlock2);
            eaw3.run<void>(this.fooTestUnlock3);
            eaw.join();
            eaw2.join();
            eaw3.join();
            this.stringTest1TmpUnlock = " ";
          })
          .borderRadius(NUM_8)
          .backgroundColor(0x317aff)
          .width("80%")
        Column() {
          Text("$r('app.string.EAWorkerTextTest4')").height(NUM_50)
          Text(this.stringTest1Unlock).width("90%")
        }
      }.height(NUM_200)

      Column() {
        Button($r('app.string.EAWorkerButtonTest5'))
          .onClick((e: ClickEvent) => {
            let eaw: EAWorker = new EAWorker(true);
            let eaw2: EAWorker = new EAWorker(true);
            eaw.run<void>(this.fooMapTest);
            eaw2.run<void>(this.fooMapTest2);
            eaw.join();
            eaw2.join();
            setTimeout(() => {
              this.mapString = JSON.stringify(mapTest.size);
            }, 100)
          })
          .borderRadius(NUM_8)
          .backgroundColor(0x317aff)
          .width("80%")
        Column() {
          Text($r('app.string.EAWorkerTextTest5')).height(NUM_50)
          Text(this.mapString).width("90%")
        }
      }.height(NUM_200)

      Column() {
        Button($r('app.string.EAWorkerButtonTest6'))
          .onClick((e: ClickEvent) => {
            hilog.info(0x0000, 'testTag', 'On Click');
            let path: string = "/data/storage/el2/base/haps/entry/files/test.txt";
            let str: string = "com.samples.EAWorker successfully launched";
            createFileTest(path, str);
            let eaw: EAWorker = new EAWorker(true);
            eaw.run<void>(this.readFile, path);
            eaw.join();
          })
          .borderRadius(NUM_8)
          .backgroundColor(0x317aff)
          .width("80%")
        Column() {
          Text($r('app.string.EAWorkerTextTest6')).height(NUM_50)
          Text(this.stringFile).width("90%")
        }
      }.height(NUM_200)

      Text("-------------------taskPool------------------").width("100%")
      Column() {
        Button($r('app.string.TaskPoolButtonTest'))
          .onClick((e: ClickEvent) => {
            hilog.info(0x0000, 'testTag', 'On Click');
            this.taskTest();
          })
          .borderRadius(NUM_8)
          .backgroundColor(0x317aff)
          .width("80%")
        Column() {
          Text($r('app.string.TaskPoolTextTest')).height(NUM_50)
          Text(this.taskGroupString).width("90%")
        }
      }.height(NUM_200)

      Column() {
        Button($r('app.string.TaskPoolButtonTest2'))
          .onClick((e: ClickEvent) => {
            this.concurrentFunc();
          })
          .borderRadius(NUM_8)
          .backgroundColor(0x317aff)
          .width("80%")
        Column() {
          Text($r('app.string.TaskPoolTextTest2')).height(NUM_50)
            .height(NUM_50)
          Text(this.priorityString).width("90%")
        }
      }.height(NUM_200)

      Column() {
        Button($r('app.string.TaskPoolButtonTest3'))
          .onClick((e: ClickEvent) => {
            hilog.info(0x0000, 'testTag', 'On Click');
            this.concurrentFuncAdd();
          })
          .borderRadius(NUM_8)
          .backgroundColor(0x317aff)
          .width("80%")
        Column() {
          Text($r('app.string.TaskPoolTextTest3'))
            .height(NUM_50)
          Text(this.addString).width("90%")
        }
      }.height(NUM_200)
    }
  }
}

export class ComExampleTrivialApplication extends UserView {
  getBuilder() {
    hilog.info(0x0000, 'testTag', 'getBuilder');
    let wrapper = @memo() =>{
      hilog.info(0x0000, 'testTag', 'MyStateSample');
      MyStateSample(undefined);
    }
    return wrapper;
  }
}