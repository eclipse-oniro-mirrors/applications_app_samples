/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// [Start copy_arraybuffer_transfer]
import { taskpool } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

// 在Task执行的处理函数，用于处理ArrayBuffer数据
@Concurrent
function adjustImageValue(arrayBuffer: ArrayBuffer): ArrayBuffer {
  // 对arrayBuffer进行操作，返回值默认转移
  return arrayBuffer;
}

/*
 * 创建一个Task，用于将ArrayBuffer传入Task执行
 * isParamsByCopy用于控制ArrayBuffer是“拷贝”还是“转移”传递
 */
function createImageTask(arrayBuffer: ArrayBuffer, isParamsByCopy: boolean): taskpool.Task {
  let task: taskpool.Task = new taskpool.Task(adjustImageValue, arrayBuffer);
  if (isParamsByCopy) {
    // 传递空数组[]，全部arrayBuffer参数传递均采用拷贝方式
    try {
      task.setTransferList([]);
    } catch (err) {
      hilog.error(0x0000, 'testTag', 'Failed to set transferList. Cause: %{public}s', JSON.stringify(err));
    }
  }
  return task;
}

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    RelativeContainer() {
      Text(this.message)
        .id('HelloWorld')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
        .onClick(() => {
          // 创建待处理的ArrayBuffer，并按taskNum进行切分
          let taskNum = 4;
          let arrayBuffer = new ArrayBuffer(1024 * 1024);
          let taskPoolGroup = new taskpool.TaskGroup();
          // 创建taskNum个Task
          for (let i: number = 0; i < taskNum; i++) {
            let arrayBufferSlice: ArrayBuffer =
              arrayBuffer.slice(arrayBuffer.byteLength / taskNum * i, arrayBuffer.byteLength / taskNum * (i + 1));
            // isParamsByCopy为true时，就可以实现拷贝方式的传输
            taskPoolGroup.addTask(createImageTask(arrayBufferSlice, true));
          }
          // 执行Task，UI主线程接收处理完成后的结果
          taskpool.execute(taskPoolGroup).then((data) => {
            // 将各Task返回的ArrayBuffer数据（即data，此处data为包含4组arrayBufferSlice的长度为4的数组）进行拼接等后续处理，此处不再列举具体操作
            // [StartExclude copy_arraybuffer_transfer]
            // [EndExclude copy_arraybuffer_transfer]
            this.message = 'success';
          }).catch((e: BusinessError) => {
            this.message = 'fail';
            console.error(`taskpool: execute task: code: ${e.code}, message: ${e.message}`);
          })
        })
    }
    .height('100%')
    .width('100%')
  }
}
// [End copy_arraybuffer_transfer]
