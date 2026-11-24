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
 * LazyForEach 使用的数据源基类，负责维护数据变更监听器。
 *
 * 基类的 totalCount 与 getData 由子类覆盖，子类只需提供真实数据。
 *
 * @param T 数据项类型
 */
export class BaseDataSource<T> implements IDataSource {
    private listeners: DataChangeListener[] = []

    /**
     * 数据项总数，基类返回 0，由子类覆盖。
     *
     * @returns 数据项总数
     */
    public totalCount(): number {
        return 0
    }

    /**
     * 取指定下标的数据项，基类返回 undefined，由子类覆盖。
     *
     * @param index 下标
     * @returns 数据项
     */
    public getData(index: number): T | undefined {
        return undefined
    }

    /**
     * 注册数据变更监听器，重复注册同一次监听器不生效。
     *
     * @param listener 监听器
     */
    public registerDataChangeListener(listener: DataChangeListener): void {
        if (this.listeners.indexOf(listener) < 0) {
            this.listeners.push(listener)
        }
    }

    /**
     * 注销数据变更监听器。
     *
     * @param listener 监听器
     */
    public unregisterDataChangeListener(listener: DataChangeListener): void {
        const pos: number = this.listeners.indexOf(listener)
        if (pos >= 0) {
            this.listeners.splice(pos, 1)
        }
    }

    /**
     * 已注册的监听器数量。
     *
     * @returns 监听器数量
     */
    public listenerCount(): number {
        return this.listeners.length
    }

    /**
     * 通知全部数据重新加载。
     */
    public notifyDataReload(): void {
        this.listeners.forEach((listener: DataChangeListener) => {
            listener.onDataReloaded()
        })
    }

    /**
     * 通知新增一条数据。
     *
     * @param index 新增位置
     */
    public notifyDataAdd(index: number): void {
        this.listeners.forEach((listener: DataChangeListener) => {
            listener.onDataAdd(index)
        })
    }

    /**
     * 通知某条数据发生变化。
     *
     * @param index 变化位置
     */
    public notifyDataChange(index: number): void {
        this.listeners.forEach((listener: DataChangeListener) => {
            listener.onDataChange(index)
        })
    }

    /**
     * 通知删除一条数据。
     *
     * @param index 删除位置
     */
    public notifyDataDelete(index: number): void {
        this.listeners.forEach((listener: DataChangeListener) => {
            listener.onDataDelete(index)
        })
    }

    /**
     * 通知数据位置移动。
     *
     * @param from 移动前位置
     * @param to 移动后位置
     */
    public notifyDataMove(from: number, to: number): void {
        this.listeners.forEach((listener: DataChangeListener) => {
            listener.onDataMove(from, to)
        })
    }
}
