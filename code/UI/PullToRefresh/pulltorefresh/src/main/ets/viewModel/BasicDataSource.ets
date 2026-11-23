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

/**
 * @file pulltorefresh/src/main/ets/viewModel/BasicDataSource.ets
 * 文件职责：BasicDataSource 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：BasicDataSource。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

export class BasicDataSource implements IDataSource {
  private listeners: DataChangeListener[] = [];

  /**
   * totalCount：执行 totalCount 相关逻辑。
   */
  public totalCount(): number {
    return 0;
  }

  /**
   * getData：执行 getData 相关逻辑。
   */
  public getData(index: number): Object {
    return index;
  }

  // 为LazyForEach组件向其数据源处添加listener监听
  /**
   * registerDataChangeListener：执行 registerDataChangeListener 相关逻辑。
   */
  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      this.listeners.push(listener);
    }
  }

  // 为对应的LazyForEach组件在数据源处去除listener监听
  /**
   * unregisterDataChangeListener：执行 unregisterDataChangeListener 相关逻辑。
   */
  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener);
    if (pos >= 0) {
      this.listeners.splice(pos, 1);
    }
  }

  // 通知LazyForEach组件需要重载所有子组件
  /**
   * notifyDataReload：执行 notifyDataReload 相关逻辑。
   */
  notifyDataReload(): void {
    this.listeners.forEach(listener => {
      listener.onDataReloaded();
    })
  }

  // 通知LazyForEach组件需要在index对应索引处添加子组件
  /**
   * notifyDataAdd：执行 notifyDataAdd 相关逻辑。
   */
  notifyDataAdd(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataAdd(index);
    })
  }

  // 通知LazyForEach组件需要在index对应索引处添加子组件
  /**
   * notifyDataChange：执行 notifyDataChange 相关逻辑。
   */
  notifyDataChange(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataChange(index);
    })
  }

  // 通知LazyForEach组件需要在index对应索引处删除该子组件
  /**
   * notifyDataDelete：执行 notifyDataDelete 相关逻辑。
   */
  notifyDataDelete(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataDelete(index);
    })
  }

  /**
   * notifyDataMove：执行 notifyDataMove 相关逻辑。
   */
  notifyDataMove(from: number, to: number): void {
    this.listeners.forEach(listener => {
      listener.onDataMove(from, to);
    })
  }
}