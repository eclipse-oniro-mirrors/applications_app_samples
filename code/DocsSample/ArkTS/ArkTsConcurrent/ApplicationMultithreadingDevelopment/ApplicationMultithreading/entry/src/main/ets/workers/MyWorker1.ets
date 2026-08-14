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

// [Start interact_main_thread]
import { worker, ThreadWorkerGlobalScope, MessageEvents, ErrorEvent } from '@kit.ArkTS';

let workerPort: ThreadWorkerGlobalScope = worker.workerPort;

// 假设模型为：每平米价格 = (model.areaCoefficient * area + model.roomCoefficient * room) * model.basePrice
class PriceModel {
  public areaCoefficient: number = 0;   // 房屋面积系数
  public roomCoefficient: number = 0;   // 房间数量系数
  public basePrice: number = 0;         // 基础值
}

// 全局模型实例
const model: PriceModel = new PriceModel();

// 定义预测函数
function predict(area: number, room: number): number {
  // 数据举例：80平米4室，房价预计为22400元每平米
  return (model.areaCoefficient * area + model.roomCoefficient * room) * model.basePrice;
}

// 定义优化器训练过程
function optimize(): void {
  // 样例主要演示整体流程，训练过程简化处理
  model.areaCoefficient = 3;
  model.roomCoefficient = 500;
  model.basePrice = 10;
}

// Worker线程的onmessage逻辑
workerPort.onmessage = (e: MessageEvents): void => {
  // 根据传输的数据的type选择进行操作
  switch (e.data.type as number) {
    case 0:
      // 进行训练
      optimize();
      // 训练之后给宿主线程发送训练成功的消息
      workerPort.postMessage({ type: 'message', value: 'train success.' });
      break;
    case 1:
      // 执行预测
      const output: number = predict(e.data.area as number, e.data.room as number);
      // 给宿主线程发送预测的结果
      workerPort.postMessage({ type: 'predict', value: output });
      break;
    default:
      workerPort.postMessage({ type: 'message', value: 'send message is invalid' });
      break;
  }
  // 按需销毁线程，本样例不需要
}
// [End interact_main_thread]