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
 * 首页与侧边栏展示的示例应用条目。
 */
export interface BundleEntry {
    img: Resource
    text: Resource
    name: string
}

/**
 * 示例应用目录，固定三个应用。
 *
 * 条目顺序即界面展示顺序，idOf 决定控件 id。
 */
export class BundleCatalog {
    private static readonly ENTRIES: BundleEntry[] = [
        { img: $r('app.media.music'), text: $r('app.string.music'), name: 'Music' },
        { img: $r('app.media.video'), text: $r('app.string.video'), name: 'Video' },
        { img: $r('app.media.map'), text: $r('app.string.map'), name: 'Map' }
    ]

    /**
     * 条目总数。
     *
     * @returns 条目数
     */
    public static count(): number {
        return BundleCatalog.ENTRIES.length
    }

    /**
     * 全部条目的副本，供 LazyForEach 数据源持有。
     *
     * @returns 条目数组
     */
    public static entries(): BundleEntry[] {
        return BundleCatalog.ENTRIES.slice()
    }

    /**
     * 取指定下标的条目。
     *
     * @param index 下标
     * @returns 条目，越界返回 undefined
     */
    public static getAt(index: number): BundleEntry | undefined {
        if (index < 0 || index >= BundleCatalog.ENTRIES.length) {
            return undefined
        }
        return BundleCatalog.ENTRIES[index]
    }

    /**
     * 全部条目的应用名，按展示顺序。
     *
     * @returns 应用名数组
     */
    public static names(): string[] {
        let result: string[] = []
        BundleCatalog.ENTRIES.forEach((item: BundleEntry) => {
            result.push(item.name)
        })
        return result
    }

    /**
     * 是否为已知的示例应用。
     *
     * @param name 应用名
     * @returns 已知返回 true
     */
    public static contains(name: string): boolean {
        return BundleCatalog.names().indexOf(name) >= 0
    }

    /**
     * 默认应用名，即第一条目的应用名。
     *
     * @returns 应用名
     */
    public static defaultName(): string {
        return BundleCatalog.ENTRIES[0].name
    }

    /**
     * 条目对应的控件 id，形如 `MusicApp`。
     *
     * @param name 应用名
     * @returns 控件 id
     */
    public static idOf(name: string): string {
        return `${name}App`
    }
}
