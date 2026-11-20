/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
 * @file casesfeature/immersive/src/main/ets/model/CommentDataSource.ets
 * 文件职责：CommentDataSource 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：CommentDataSource。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

export class CommentDataSource implements IDataSource {
  private elements: number[] = [];
  private listeners: Set<DataChangeListener>;

  /** 构造 CommentDataSource 实例。 */
  constructor(elements: number[]) {
    this.elements = elements;
    this.listeners = new Set();
  }

  /**
   * totalCount：执行 totalCount 相关逻辑。
   */
  totalCount(): number {
    return this.elements.length;
  }

  /**
   * getData：执行 getData 相关逻辑。
   */
  getData(index: number): number {
    return this.elements[index];
  }

  /**
   * registerDataChangeListener：执行 registerDataChangeListener 相关逻辑。
   */
  registerDataChangeListener(listener: DataChangeListener): void {
    this.listeners.add(listener);
  }

  /**
   * unregisterDataChangeListener：执行 unregisterDataChangeListener 相关逻辑。
   */
  unregisterDataChangeListener(listener: DataChangeListener): void {
    this.listeners.delete(listener);
  }

  /**
   * pushItem：执行 pushItem 相关逻辑。
   */
  pushItem(item: number) {
    this.elements.push(item);
    this.listeners.forEach(listeners => {
      listeners.onDataAdd(this.elements.length);
    })
  }
}