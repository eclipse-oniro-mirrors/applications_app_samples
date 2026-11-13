/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

/**
 * 用例之间让出主线程。
 *
 * hypium 把整批用例串在同一个主线程任务里执行，await 一个已完成的 Promise 只产生微任务，
 * 不会把控制权交还事件循环；累计占用超过 6 s 时系统判定 THREAD_BLOCK_6S 并结束进程
 * （报告里表现为 `TestFinished-ResultMsg: App died`）。
 *
 * 这里每 TICK_EVERY 条用例插入一次真实的定时器任务，让主线程回到事件循环、占用计时归零。
 * 单条用例耗时只有毫秒量级，攒 TICK_EVERY 条也远低于 6 s 阈值；
 * 而每次定时器回调在设备上要几十毫秒，所以不做成每条都等，否则整套时长会被拉长数倍。
 */
const TICK_EVERY: number = 10;

/** 定时器至少 1 ms，0 ms 会被当成同一次任务处理，起不到让出作用 */
const TICK_MS: number = 1;

let calls: number = 0;

export function tick(): Promise<void> {
  calls++;
  if (calls % TICK_EVERY !== 0) {
    return Promise.resolve();
  }
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => {
      resolve();
    }, TICK_MS);
  });
}
