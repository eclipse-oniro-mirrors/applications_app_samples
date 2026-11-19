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
 * @file src/main/ets/model/DateSource.ets
 * 文件职责：DateSource 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：DataSource。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { AppInfo } from './AppInfo';

/**
 * DataSource：类定义，承载本文件对应的逻辑与数据。
 */
export class DataSource implements IDataSource {
  // 数据变化监听器
  private listeners: DataChangeListener[] = [];
  private appInfoList: AppInfo[] = [];

  /**
   * totalCount：执行 totalCount 相关逻辑。
   */
  totalCount(): number {
    return this.appInfoList.length;
  }

  /**
   * setData：执行 setData 相关逻辑。
   */
  setData(index: number, data: AppInfo) {
    this.appInfoList[index] = data;
  }

  /**
   * getData：执行 getData 相关逻辑。
   */
  getData(index: number): AppInfo {
    return this.appInfoList[index];
  }

  // 该方法为框架侧调用，为LazyForEach组件向其数据源处添加listener监听
  /**
   * registerDataChangeListener：执行 registerDataChangeListener 相关逻辑。
   */
  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      this.listeners.push(listener);
    }
  }

  // 该方法为框架侧调用，为对应的LazyForEach组件在数据源处去除listener监听
  /**
   * unregisterDataChangeListener：执行 unregisterDataChangeListener 相关逻辑。
   */
  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener);
    if (pos >= 0) {
      this.listeners.splice(pos, 1);
    }
  }

  /**
   * 添加数据
   * @param data 虚拟数据
   */
  pushData(data: AppInfo): void {
    this.appInfoList.push(data);
    this.notifyDataAdd(this.appInfoList.length - 1);
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

  // 通知LazyForEach组件在index对应索引处数据有变化，需要重建该子组件
  /**
   * notifyDataChange：执行 notifyDataChange 相关逻辑。
   */
  notifyDataChange(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataChange(index);
    })
  }

  // 通知LazyForEach组件将from索引和to索引处的子组件进行交换
  /**
   * notifyDataMove：执行 notifyDataMove 相关逻辑。
   */
  notifyDataMove(from: number, to: number): void {
    this.listeners.forEach(listener => {
      listener.onDataMove(from, to);
    })
  }
}