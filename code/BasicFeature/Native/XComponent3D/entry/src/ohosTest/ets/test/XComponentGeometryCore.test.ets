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

import {
    animate, changeShape, GetXComponentSize_Width, GetXComponentSize_Height,
    GetXComponentOffset_x, GetXComponentOffset_y
} from 'libnativerender.so';
import { describe, it, beforeEach, expect, TestType, Size, Level } from '@ohos/hypium';
import { resetYieldCounter, yieldToSystem } from './common/TestYield';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AppXComponent3D]';

// 测试页 testability/pages/Index.ets 的布局规格：200x100 vp 绘制区，margin left=16 / top=24。
// 真机上 OH_NativeXComponent_GetXComponentSize 回读的是 px（= vp × 设备密度，实测 200x100vp 得 300x150），
// OH_NativeXComponent_GetXComponentOffset 当前实现恒返回 0，因此几何断言只验证与设备密度无关的
// 等比关系与非负性，不绑定具体 vp / px 数值。
const LAYOUT_WIDTH: number = 200;
const LAYOUT_HEIGHT: number = 100;
const GEOMETRY_TOLERANCE: number = 2;
const READY_WAIT_MS: number = 10000;
const POLL_INTERVAL_MS: number = 50;

let surfaceProbed: boolean = false;
let surfaceReady: boolean = false;

function delay(intervalMs: number): Promise<void> {
    return new Promise<void>((resolve) => {
        setTimeout(() => {
            resolve();
        }, intervalMs);
    });
}

// TestAbility 在 onCreate 中启动 Hypium，页面在 onWindowStageCreate 中异步加载，
// 因此指定用例需要轮询等待绘制区创建回调完成，此后结果即为确定的环境状态。
async function waitSurfaceReady(): Promise<boolean> {
    const deadline: number = Date.now() + READY_WAIT_MS;
    while (Date.now() < deadline) {
        if (GetXComponentSize_Width() > 0 && GetXComponentSize_Height() > 0) {
            return true;
        }
        await delay(POLL_INTERVAL_MS);
    }
    return false;
}

async function ensureSurfaceReady(): Promise<boolean> {
    if (!surfaceProbed) {
        surfaceReady = await waitSurfaceReady();
        surfaceProbed = true;
        hilog.info(DOMAIN, TAG, 'render ready = %{public}s', surfaceReady ? 'true' : 'false');
    }
    // 几何真值诊断：hilog 不支持 %f，统一用字符串输出实际回读值
    hilog.info(DOMAIN, TAG, 'render geometry w=%{public}s h=%{public}s x=%{public}s y=%{public}s',
        String(GetXComponentSize_Width()), String(GetXComponentSize_Height()),
        String(GetXComponentOffset_x()), String(GetXComponentOffset_y()));
    return surfaceReady;
}

function within(value: number, target: number): boolean {
    return Math.abs(value - target) <= GEOMETRY_TOLERANCE;
}

// 回读尺寸与布局的等比关系：交叉乘积相等即说明 width:height 与 200:100 同比例，
// 该判定与设备密度无关（300x150、400x200 均成立），回读为整数像素时容差 2 足够容纳舍入。
function matchesLayoutRatio(width: number, height: number): boolean {
    return within(width * LAYOUT_HEIGHT, height * LAYOUT_WIDTH);
}

export default function xComponentGeometryTest() {
    resetYieldCounter();
    describe('XComponentGeometryTest', () => {

    beforeEach(async () => {
      await yieldToSystem();
    });

        /**
         * @tc.number SUB_XCOMPONENT3D_GEOMETRY_0001
         * @tc.name testXComponentGeometry0001
         * @tc.desc 合法值：绘制区建立后回读宽度为正，且宽高与布局 200:100 等比（回读单位为 px）
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testXComponentGeometry0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentGeometry0001 begin');
            await ensureSurfaceReady();
            const width: number = GetXComponentSize_Width();
            const height: number = GetXComponentSize_Height();
            expect(width > 0).assertTrue();
            expect(matchesLayoutRatio(width, height)).assertTrue();
            expect(width === 0).assertFalse();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentGeometry0001 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_GEOMETRY_0002
         * @tc.name testXComponentGeometry0002
         * @tc.desc 合法值：绘制区建立后回读高度为正、小于宽度，且宽高与布局 200:100 等比
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testXComponentGeometry0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentGeometry0002 begin');
            await ensureSurfaceReady();
            const height: number = GetXComponentSize_Height();
            expect(height > 0).assertTrue();
            expect(matchesLayoutRatio(GetXComponentSize_Width(), height)).assertTrue();
            expect(height < GetXComponentSize_Width()).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentGeometry0002 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_GEOMETRY_0003
         * @tc.name testXComponentGeometry0003
         * @tc.desc 合法值：宽高比落在布局 2:1 的容差区间内，且不是 1:1
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testXComponentGeometry0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentGeometry0003 begin');
            await ensureSurfaceReady();
            const width: number = GetXComponentSize_Width();
            const height: number = GetXComponentSize_Height();
            expect(width / height > 1.8).assertTrue();
            expect(width / height < 2.2).assertTrue();
            expect(width / height === 1).assertFalse();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentGeometry0003 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_GEOMETRY_0004
         * @tc.name testXComponentGeometry0004
         * @tc.desc 合法值：offset 两轴均为非负有限值，当前框架实现统一回读为 0
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testXComponentGeometry0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentGeometry0004 begin');
            await ensureSurfaceReady();
            const offsetX: number = GetXComponentOffset_x();
            const offsetY: number = GetXComponentOffset_y();
            expect(offsetX >= 0).assertTrue();
            expect(offsetY >= 0).assertTrue();
            expect(Number.isFinite(offsetX) && Number.isFinite(offsetY)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentGeometry0004 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_GEOMETRY_0005
         * @tc.name testXComponentGeometry0005
         * @tc.desc 合法值：offset 与 size 的比值落在 [0, 1) 内，偏移不越出绘制区且与屏幕密度无关
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testXComponentGeometry0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentGeometry0005 begin');
            await ensureSurfaceReady();
            const width: number = GetXComponentSize_Width();
            const height: number = GetXComponentSize_Height();
            const ratioX: number = GetXComponentOffset_x() / width;
            const ratioY: number = GetXComponentOffset_y() / height;
            expect(ratioX >= 0 && ratioX < 1).assertTrue();
            expect(ratioY >= 0 && ratioY < 1).assertTrue();
            expect(Number.isFinite(ratioX) && Number.isFinite(ratioY)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentGeometry0005 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_GEOMETRY_0006
         * @tc.name testXComponentGeometry0006
         * @tc.desc 边界值：size 由 napi_create_uint32 导出，四个回读值均为有限数值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testXComponentGeometry0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentGeometry0006 begin');
            await ensureSurfaceReady();
            expect(Number.isFinite(GetXComponentSize_Width())).assertTrue();
            expect(Number.isFinite(GetXComponentSize_Height())).assertTrue();
            expect(Number.isFinite(GetXComponentOffset_x())).assertTrue();
            expect(Number.isFinite(GetXComponentOffset_y())).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentGeometry0006 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_GEOMETRY_0007
         * @tc.name testXComponentGeometry0007
         * @tc.desc 边界值：size 为 uint32 语义的整数，不出现小数部分
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testXComponentGeometry0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentGeometry0007 begin');
            await ensureSurfaceReady();
            const width: number = GetXComponentSize_Width();
            const height: number = GetXComponentSize_Height();
            expect(Number.isInteger(width)).assertTrue();
            expect(Number.isInteger(height)).assertTrue();
            expect(width % 1 === 0 && height % 1 === 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentGeometry0007 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_GEOMETRY_0008
         * @tc.name testXComponentGeometry0008
         * @tc.desc 边界值：size 下界为 1 且不超过 4000，不会退化为 0 或溢出为异常大值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testXComponentGeometry0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentGeometry0008 begin');
            await ensureSurfaceReady();
            const width: number = GetXComponentSize_Width();
            const height: number = GetXComponentSize_Height();
            expect(width >= 1).assertTrue();
            expect(width <= 4000).assertTrue();
            expect(height >= 1 && height <= 4000).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentGeometry0008 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_GEOMETRY_0009
         * @tc.name testXComponentGeometry0009
         * @tc.desc 边界值：offset 回读为整数，下界为 0 且不出现负偏移
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testXComponentGeometry0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentGeometry0009 begin');
            await ensureSurfaceReady();
            const offsetX: number = GetXComponentOffset_x();
            const offsetY: number = GetXComponentOffset_y();
            expect(Number.isInteger(offsetX)).assertTrue();
            expect(Number.isInteger(offsetY)).assertTrue();
            expect(offsetY >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentGeometry0009 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_GEOMETRY_0010
         * @tc.name testXComponentGeometry0010
         * @tc.desc 非法入参：四个回读接口均无入参，重复调用不抛异常且维持确定性结果
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testXComponentGeometry0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentGeometry0010 begin');
            await ensureSurfaceReady();
            const width: number = GetXComponentSize_Width();
            const height: number = GetXComponentSize_Height();
            expect(width).assertEqual(GetXComponentSize_Width());
            expect(height).assertEqual(GetXComponentSize_Height());
            expect(width > 0 && height > 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentGeometry0010 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_GEOMETRY_0011
         * @tc.name testXComponentGeometry0011
         * @tc.desc 极值：连续 1000 次回读宽度不产生漂移，首末值一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testXComponentGeometry0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentGeometry0011 begin');
            await ensureSurfaceReady();
            const first: number = GetXComponentSize_Width();
            let changed: boolean = false;
            let last: number = first;
            for (let i = 0; i < 1000; i++) {
                const current: number = GetXComponentSize_Width();
                if (current !== first) {
                    changed = true;
                }
                last = current;
            }
            expect(changed).assertFalse();
            expect(last).assertEqual(first);
            expect(last > 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentGeometry0011 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_GEOMETRY_0012
         * @tc.name testXComponentGeometry0012
         * @tc.desc 极值：200 轮四个接口交替回读后几何量全部保持首轮取值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testXComponentGeometry0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentGeometry0012 begin');
            await ensureSurfaceReady();
            const width0: number = GetXComponentSize_Width();
            const height0: number = GetXComponentSize_Height();
            const offsetX0: number = GetXComponentOffset_x();
            const offsetY0: number = GetXComponentOffset_y();
            let stable: boolean = true;
            for (let i = 0; i < 200; i++) {
                if (GetXComponentSize_Width() !== width0 || GetXComponentSize_Height() !== height0 ||
                    GetXComponentOffset_x() !== offsetX0 || GetXComponentOffset_y() !== offsetY0) {
                    stable = false;
                }
            }
            expect(stable).assertTrue();
            expect(GetXComponentSize_Height()).assertEqual(height0);
            expect(GetXComponentOffset_y()).assertEqual(offsetY0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentGeometry0012 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_GEOMETRY_0013
         * @tc.name testXComponentGeometry0013
         * @tc.desc 组合：changeShape 切换形状后 size 保持不变，且宽高仍与布局 200:100 等比
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testXComponentGeometry0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentGeometry0013 begin');
            await ensureSurfaceReady();
            const width0: number = GetXComponentSize_Width();
            const height0: number = GetXComponentSize_Height();
            changeShape(1);
            expect(GetXComponentSize_Width()).assertEqual(width0);
            expect(GetXComponentSize_Height()).assertEqual(height0);
            expect(matchesLayoutRatio(GetXComponentSize_Width(), GetXComponentSize_Height())).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentGeometry0013 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_GEOMETRY_0014
         * @tc.name testXComponentGeometry0014
         * @tc.desc 组合：changeShape 切换形状后 offset 保持不变，缓存不被重绘覆盖
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testXComponentGeometry0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentGeometry0014 begin');
            await ensureSurfaceReady();
            const offsetX0: number = GetXComponentOffset_x();
            const offsetY0: number = GetXComponentOffset_y();
            changeShape(0);
            expect(GetXComponentOffset_x()).assertEqual(offsetX0);
            expect(GetXComponentOffset_y()).assertEqual(offsetY0);
            expect(offsetX0 >= 0 && offsetY0 >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentGeometry0014 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_GEOMETRY_0015
         * @tc.name testXComponentGeometry0015
         * @tc.desc 组合：animate 重绘后 size 与 offset 均不变，帧驱动不改几何缓存
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testXComponentGeometry0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentGeometry0015 begin');
            await ensureSurfaceReady();
            const width0: number = GetXComponentSize_Width();
            const offsetY0: number = GetXComponentOffset_y();
            animate();
            animate();
            expect(GetXComponentSize_Width()).assertEqual(width0);
            expect(GetXComponentOffset_y()).assertEqual(offsetY0);
            expect(GetXComponentSize_Height() > 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentGeometry0015 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_GEOMETRY_0016
         * @tc.name testXComponentGeometry0016
         * @tc.desc 组合：changeShape 与 animate 交替 5 轮后四个几何量全部保持初始值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testXComponentGeometry0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentGeometry0016 begin');
            await ensureSurfaceReady();
            const width0: number = GetXComponentSize_Width();
            const height0: number = GetXComponentSize_Height();
            const offsetX0: number = GetXComponentOffset_x();
            const offsetY0: number = GetXComponentOffset_y();
            for (let i = 0; i < 5; i++) {
                animate();
                changeShape(i % 2);
            }
            expect(GetXComponentSize_Width()).assertEqual(width0);
            expect(GetXComponentSize_Height()).assertEqual(height0);
            expect(GetXComponentOffset_x()).assertEqual(offsetX0);
            expect(GetXComponentOffset_y()).assertEqual(offsetY0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentGeometry0016 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_GEOMETRY_0017
         * @tc.name testXComponentGeometry0017
         * @tc.desc 状态：相邻两次回读存在稳定缓存，四个接口各自幂等
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testXComponentGeometry0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentGeometry0017 begin');
            await ensureSurfaceReady();
            expect(GetXComponentSize_Width()).assertEqual(GetXComponentSize_Width());
            expect(GetXComponentSize_Height()).assertEqual(GetXComponentSize_Height());
            expect(GetXComponentOffset_x()).assertEqual(GetXComponentOffset_x());
            expect(GetXComponentOffset_y()).assertEqual(GetXComponentOffset_y());
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentGeometry0017 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_GEOMETRY_0018
         * @tc.name testXComponentGeometry0018
         * @tc.desc 状态：size 与 offset 同时可读，说明绘制区创建回调已完成几何量缓存（offset 恒为 0）
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testXComponentGeometry0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentGeometry0018 begin');
            await ensureSurfaceReady();
            const width: number = GetXComponentSize_Width();
            const height: number = GetXComponentSize_Height();
            const offsetSum: number = GetXComponentOffset_x() + GetXComponentOffset_y();
            expect(width > 0).assertTrue();
            expect(height > 0).assertTrue();
            expect(offsetSum >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentGeometry0018 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_GEOMETRY_0019
         * @tc.name testXComponentGeometry0019
         * @tc.desc 状态：offset 在多次调用中保持非负且不随 size 回读顺序变化
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testXComponentGeometry0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentGeometry0019 begin');
            await ensureSurfaceReady();
            const offsetX: number = GetXComponentOffset_x();
            const offsetY: number = GetXComponentOffset_y();
            expect(offsetX >= 0).assertTrue();
            expect(offsetY >= 0).assertTrue();
            expect(offsetX).assertEqual(GetXComponentOffset_x());
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentGeometry0019 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_GEOMETRY_0020
         * @tc.name testXComponentGeometry0020
         * @tc.desc 状态：几何量与 shapeIndex 状态解耦，切换形状后 size 仍与布局等比
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testXComponentGeometry0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentGeometry0020 begin');
            await ensureSurfaceReady();
            changeShape(0);
            const widthAtCube: number = GetXComponentSize_Width();
            changeShape(4294967295);
            const widthAtMax: number = GetXComponentSize_Width();
            expect(widthAtMax).assertEqual(widthAtCube);
            expect(widthAtCube > 0).assertTrue();
            expect(matchesLayoutRatio(widthAtCube, GetXComponentSize_Height())).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentGeometry0020 end');
        });
    });
}
