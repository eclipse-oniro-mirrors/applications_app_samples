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
 * 响应式布局判定与路由参数回落规则。
 *
 * 页面在 onAreaChange 里拿到宽度后调用 isWideLayout 决定单栏还是双栏。
 */
export class LayoutPolicy {
    /**
     * 单栏与双栏的宽度分界值，单位 vp。
     */
    public static readonly SPLIT_THRESHOLD: number = 840;
    /**
     * 未从路由参数拿到应用名时使用的默认示例应用。
     */
    public static readonly DEFAULT_BUNDLE_NAME: string = 'Music';

    /**
     * 给定可用宽度是否为宽屏布局。
     *
     * @param width 宽度，单位 vp
     * @returns 大于等于分界值返回 true
     */
    public static isWideLayout(width: number): boolean {
        return width >= LayoutPolicy.SPLIT_THRESHOLD;
    }

    /**
     * 从路由参数里取出应用名，缺省返回空串，由调用方决定是否覆盖当前选择。
     *
     * @param param 路由参数中的 bundleName
     * @returns 应用名，缺省为空串
     */
    public static resolveBundleName(param: string | undefined): string {
        return param ?? '';
    }
}
