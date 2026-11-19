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

import { beforeEachIt, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Graphics3d]';

export default function g3dRouteMatrix1Test(): void {
  describe('G3dRouteFactsMatrix1Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    G3D_ROUTE_0001
     * @tc.name      g3dRouteRoute0001
     * @tc.desc      页面路由 pages/Index 的分段与首尾结构校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dRouteRoute0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dRouteRoute0001 begin');
      const route: string = 'pages/Index';
      const segments: string[] = route.split('/');
      hilog.info(DOMAIN, TAG, '%{public}s', 'route=' + route);
      expect(segments.length).assertEqual(2);
      expect(segments[0]).assertEqual('pages');
      expect(segments[segments.length - 1]).assertEqual('Index');
      expect(route.startsWith('pages/')).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dRouteRoute0001 end');
    })

    /**
     * @tc.number    G3D_ROUTE_0002
     * @tc.name      g3dRouteRoute0002
     * @tc.desc      页面路由 pages/Index 的字符集与长度校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dRouteRoute0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dRouteRoute0002 begin');
      const route: string = 'pages/Index';
      hilog.info(DOMAIN, TAG, '%{public}s', 'len=' + route.length);
      expect(route.length).assertEqual(11);
      expect(route.indexOf(' ') === -1).assertTrue();
      expect(route.indexOf('//') === -1).assertTrue();
      expect(route.endsWith('Index')).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dRouteRoute0002 end');
    })

    /**
     * @tc.number    G3D_ROUTE_0003
     * @tc.name      g3dRouteRoute0003
     * @tc.desc      页面路由 pages/Index 反查页面文件名的后缀校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dRouteRoute0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dRouteRoute0003 begin');
      const name: string = 'Index';
      const file: string = name + '.ets';
      hilog.info(DOMAIN, TAG, '%{public}s', file);
      expect(file.endsWith('.ets')).assertTrue();
      expect(file.startsWith(name)).assertTrue();
      expect(file.length).assertEqual(9);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dRouteRoute0003 end');
    })

    /**
     * @tc.number    G3D_ROUTE_0004
     * @tc.name      g3dRouteRoute0004
     * @tc.desc      页面路由 graphics3d/container 的分段与首尾结构校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dRouteRoute0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dRouteRoute0004 begin');
      const route: string = 'graphics3d/container';
      const segments: string[] = route.split('/');
      hilog.info(DOMAIN, TAG, '%{public}s', 'route=' + route);
      expect(segments.length).assertEqual(2);
      expect(segments[0]).assertEqual('graphics3d');
      expect(segments[segments.length - 1]).assertEqual('container');
      expect(route.startsWith('graphics3d/')).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dRouteRoute0004 end');
    })

    /**
     * @tc.number    G3D_ROUTE_0005
     * @tc.name      g3dRouteRoute0005
     * @tc.desc      页面路由 graphics3d/container 的字符集与长度校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dRouteRoute0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dRouteRoute0005 begin');
      const route: string = 'graphics3d/container';
      hilog.info(DOMAIN, TAG, '%{public}s', 'len=' + route.length);
      expect(route.length).assertEqual(20);
      expect(route.indexOf(' ') === -1).assertTrue();
      expect(route.indexOf('//') === -1).assertTrue();
      expect(route.endsWith('container')).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dRouteRoute0005 end');
    })

    /**
     * @tc.number    G3D_ROUTE_0006
     * @tc.name      g3dRouteRoute0006
     * @tc.desc      页面路由 graphics3d/container 反查页面文件名的后缀校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dRouteRoute0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dRouteRoute0006 begin');
      const name: string = 'container';
      const file: string = name + '.ets';
      hilog.info(DOMAIN, TAG, '%{public}s', file);
      expect(file.endsWith('.ets')).assertTrue();
      expect(file.startsWith(name)).assertTrue();
      expect(file.length).assertEqual(13);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dRouteRoute0006 end');
    })

    /**
     * @tc.number    G3D_ROUTE_0007
     * @tc.name      g3dRouteRoute0007
     * @tc.desc      页面路由 graphics3d/node_base 的分段与首尾结构校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dRouteRoute0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dRouteRoute0007 begin');
      const route: string = 'graphics3d/node_base';
      const segments: string[] = route.split('/');
      hilog.info(DOMAIN, TAG, '%{public}s', 'route=' + route);
      expect(segments.length).assertEqual(2);
      expect(segments[0]).assertEqual('graphics3d');
      expect(segments[segments.length - 1]).assertEqual('node_base');
      expect(route.startsWith('graphics3d/')).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dRouteRoute0007 end');
    })

    /**
     * @tc.number    G3D_ROUTE_0008
     * @tc.name      g3dRouteRoute0008
     * @tc.desc      页面路由 graphics3d/node_base 的字符集与长度校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dRouteRoute0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dRouteRoute0008 begin');
      const route: string = 'graphics3d/node_base';
      hilog.info(DOMAIN, TAG, '%{public}s', 'len=' + route.length);
      expect(route.length).assertEqual(20);
      expect(route.indexOf(' ') === -1).assertTrue();
      expect(route.indexOf('//') === -1).assertTrue();
      expect(route.endsWith('node_base')).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dRouteRoute0008 end');
    })

    /**
     * @tc.number    G3D_ROUTE_0009
     * @tc.name      g3dRouteRoute0009
     * @tc.desc      页面路由 graphics3d/node_base 反查页面文件名的后缀校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dRouteRoute0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dRouteRoute0009 begin');
      const name: string = 'node_base';
      const file: string = name + '.ets';
      hilog.info(DOMAIN, TAG, '%{public}s', file);
      expect(file.endsWith('.ets')).assertTrue();
      expect(file.startsWith(name)).assertTrue();
      expect(file.length).assertEqual(13);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dRouteRoute0009 end');
    })

    /**
     * @tc.number    G3D_ROUTE_0010
     * @tc.name      g3dRouteRoute0010
     * @tc.desc      页面路由 graphics3d/node_camera 的分段与首尾结构校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dRouteRoute0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dRouteRoute0010 begin');
      const route: string = 'graphics3d/node_camera';
      const segments: string[] = route.split('/');
      hilog.info(DOMAIN, TAG, '%{public}s', 'route=' + route);
      expect(segments.length).assertEqual(2);
      expect(segments[0]).assertEqual('graphics3d');
      expect(segments[segments.length - 1]).assertEqual('node_camera');
      expect(route.startsWith('graphics3d/')).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dRouteRoute0010 end');
    })

    /**
     * @tc.number    G3D_ROUTE_0011
     * @tc.name      g3dRouteRoute0011
     * @tc.desc      页面路由 graphics3d/node_camera 的字符集与长度校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dRouteRoute0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dRouteRoute0011 begin');
      const route: string = 'graphics3d/node_camera';
      hilog.info(DOMAIN, TAG, '%{public}s', 'len=' + route.length);
      expect(route.length).assertEqual(22);
      expect(route.indexOf(' ') === -1).assertTrue();
      expect(route.indexOf('//') === -1).assertTrue();
      expect(route.endsWith('node_camera')).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dRouteRoute0011 end');
    })

    /**
     * @tc.number    G3D_ROUTE_0012
     * @tc.name      g3dRouteRoute0012
     * @tc.desc      页面路由 graphics3d/node_camera 反查页面文件名的后缀校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dRouteRoute0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dRouteRoute0012 begin');
      const name: string = 'node_camera';
      const file: string = name + '.ets';
      hilog.info(DOMAIN, TAG, '%{public}s', file);
      expect(file.endsWith('.ets')).assertTrue();
      expect(file.startsWith(name)).assertTrue();
      expect(file.length).assertEqual(15);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dRouteRoute0012 end');
    })

    /**
     * @tc.number    G3D_ROUTE_0013
     * @tc.name      g3dRouteRoute0013
     * @tc.desc      页面路由 graphics3d/node_light 的分段与首尾结构校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dRouteRoute0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dRouteRoute0013 begin');
      const route: string = 'graphics3d/node_light';
      const segments: string[] = route.split('/');
      hilog.info(DOMAIN, TAG, '%{public}s', 'route=' + route);
      expect(segments.length).assertEqual(2);
      expect(segments[0]).assertEqual('graphics3d');
      expect(segments[segments.length - 1]).assertEqual('node_light');
      expect(route.startsWith('graphics3d/')).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dRouteRoute0013 end');
    })

    /**
     * @tc.number    G3D_ROUTE_0014
     * @tc.name      g3dRouteRoute0014
     * @tc.desc      页面路由 graphics3d/node_light 的字符集与长度校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dRouteRoute0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dRouteRoute0014 begin');
      const route: string = 'graphics3d/node_light';
      hilog.info(DOMAIN, TAG, '%{public}s', 'len=' + route.length);
      expect(route.length).assertEqual(21);
      expect(route.indexOf(' ') === -1).assertTrue();
      expect(route.indexOf('//') === -1).assertTrue();
      expect(route.endsWith('node_light')).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dRouteRoute0014 end');
    })

    /**
     * @tc.number    G3D_ROUTE_0015
     * @tc.name      g3dRouteRoute0015
     * @tc.desc      页面路由 graphics3d/node_light 反查页面文件名的后缀校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dRouteRoute0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dRouteRoute0015 begin');
      const name: string = 'node_light';
      const file: string = name + '.ets';
      hilog.info(DOMAIN, TAG, '%{public}s', file);
      expect(file.endsWith('.ets')).assertTrue();
      expect(file.startsWith(name)).assertTrue();
      expect(file.length).assertEqual(14);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dRouteRoute0015 end');
    })

    /**
     * @tc.number    G3D_ROUTE_0016
     * @tc.name      g3dRouteRoute0016
     * @tc.desc      页面路由 graphics3d/scene_animation 的分段与首尾结构校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dRouteRoute0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dRouteRoute0016 begin');
      const route: string = 'graphics3d/scene_animation';
      const segments: string[] = route.split('/');
      hilog.info(DOMAIN, TAG, '%{public}s', 'route=' + route);
      expect(segments.length).assertEqual(2);
      expect(segments[0]).assertEqual('graphics3d');
      expect(segments[segments.length - 1]).assertEqual('scene_animation');
      expect(route.startsWith('graphics3d/')).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dRouteRoute0016 end');
    })

    /**
     * @tc.number    G3D_ROUTE_0017
     * @tc.name      g3dRouteRoute0017
     * @tc.desc      页面路由 graphics3d/scene_animation 的字符集与长度校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dRouteRoute0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dRouteRoute0017 begin');
      const route: string = 'graphics3d/scene_animation';
      hilog.info(DOMAIN, TAG, '%{public}s', 'len=' + route.length);
      expect(route.length).assertEqual(26);
      expect(route.indexOf(' ') === -1).assertTrue();
      expect(route.indexOf('//') === -1).assertTrue();
      expect(route.endsWith('scene_animation')).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dRouteRoute0017 end');
    })

    /**
     * @tc.number    G3D_ROUTE_0018
     * @tc.name      g3dRouteRoute0018
     * @tc.desc      页面路由 graphics3d/scene_animation 反查页面文件名的后缀校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dRouteRoute0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dRouteRoute0018 begin');
      const name: string = 'scene_animation';
      const file: string = name + '.ets';
      hilog.info(DOMAIN, TAG, '%{public}s', file);
      expect(file.endsWith('.ets')).assertTrue();
      expect(file.startsWith(name)).assertTrue();
      expect(file.length).assertEqual(19);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dRouteRoute0018 end');
    })

    /**
     * @tc.number    G3D_ROUTE_0019
     * @tc.name      g3dRouteRoute0019
     * @tc.desc      页面路由 graphics3d/scene_environment 的分段与首尾结构校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dRouteRoute0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dRouteRoute0019 begin');
      const route: string = 'graphics3d/scene_environment';
      const segments: string[] = route.split('/');
      hilog.info(DOMAIN, TAG, '%{public}s', 'route=' + route);
      expect(segments.length).assertEqual(2);
      expect(segments[0]).assertEqual('graphics3d');
      expect(segments[segments.length - 1]).assertEqual('scene_environment');
      expect(route.startsWith('graphics3d/')).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dRouteRoute0019 end');
    })

    /**
     * @tc.number    G3D_ROUTE_0020
     * @tc.name      g3dRouteRoute0020
     * @tc.desc      页面路由 graphics3d/scene_environment 的字符集与长度校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dRouteRoute0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dRouteRoute0020 begin');
      const route: string = 'graphics3d/scene_environment';
      hilog.info(DOMAIN, TAG, '%{public}s', 'len=' + route.length);
      expect(route.length).assertEqual(28);
      expect(route.indexOf(' ') === -1).assertTrue();
      expect(route.indexOf('//') === -1).assertTrue();
      expect(route.endsWith('scene_environment')).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dRouteRoute0020 end');
    })

    /**
     * @tc.number    G3D_ROUTE_0021
     * @tc.name      g3dRouteRoute0021
     * @tc.desc      页面路由 graphics3d/scene_environment 反查页面文件名的后缀校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dRouteRoute0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dRouteRoute0021 begin');
      const name: string = 'scene_environment';
      const file: string = name + '.ets';
      hilog.info(DOMAIN, TAG, '%{public}s', file);
      expect(file.endsWith('.ets')).assertTrue();
      expect(file.startsWith(name)).assertTrue();
      expect(file.length).assertEqual(21);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dRouteRoute0021 end');
    })

    /**
     * @tc.number    G3D_ROUTE_0022
     * @tc.name      g3dRouteRoute0022
     * @tc.desc      页面路由 graphics3d/scene_shader 的分段与首尾结构校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dRouteRoute0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dRouteRoute0022 begin');
      const route: string = 'graphics3d/scene_shader';
      const segments: string[] = route.split('/');
      hilog.info(DOMAIN, TAG, '%{public}s', 'route=' + route);
      expect(segments.length).assertEqual(2);
      expect(segments[0]).assertEqual('graphics3d');
      expect(segments[segments.length - 1]).assertEqual('scene_shader');
      expect(route.startsWith('graphics3d/')).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dRouteRoute0022 end');
    })

    /**
     * @tc.number    G3D_ROUTE_0023
     * @tc.name      g3dRouteRoute0023
     * @tc.desc      页面路由 graphics3d/scene_shader 的字符集与长度校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dRouteRoute0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dRouteRoute0023 begin');
      const route: string = 'graphics3d/scene_shader';
      hilog.info(DOMAIN, TAG, '%{public}s', 'len=' + route.length);
      expect(route.length).assertEqual(23);
      expect(route.indexOf(' ') === -1).assertTrue();
      expect(route.indexOf('//') === -1).assertTrue();
      expect(route.endsWith('scene_shader')).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dRouteRoute0023 end');
    })

    /**
     * @tc.number    G3D_ROUTE_0024
     * @tc.name      g3dRouteRoute0024
     * @tc.desc      页面路由 graphics3d/scene_shader 反查页面文件名的后缀校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dRouteRoute0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dRouteRoute0024 begin');
      const name: string = 'scene_shader';
      const file: string = name + '.ets';
      hilog.info(DOMAIN, TAG, '%{public}s', file);
      expect(file.endsWith('.ets')).assertTrue();
      expect(file.startsWith(name)).assertTrue();
      expect(file.length).assertEqual(16);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dRouteRoute0024 end');
    })

    /**
     * @tc.number    G3D_ROUTE_0025
     * @tc.name      g3dRouteRoute0025
     * @tc.desc      包名 com.samples.graphics3d 的分段与命名规范校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dRouteRoute0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dRouteRoute0025 begin');
      const bundle: string = 'com.samples.graphics3d';
      const segments: string[] = bundle.split('.');
      hilog.info(DOMAIN, TAG, '%{public}s', 'bundle=' + bundle);
      expect(segments.length).assertEqual(3);
      expect(bundle.length).assertEqual(22);
      expect(bundle.indexOf(' ') === -1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dRouteRoute0025 end');
    })

    /**
     * @tc.number    G3D_ROUTE_0026
     * @tc.name      g3dRouteRoute0026
     * @tc.desc      能力 EntryAbility 的命名与后缀校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3dRouteRoute0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dRouteRoute0026 begin');
      const ability: string = 'EntryAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', ability);
      expect(ability.endsWith('Ability')).assertTrue();
      expect(ability.length).assertEqual(12);
      expect(ability.charAt(0)).assertEqual('E');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3dRouteRoute0026 end');
    })
  })
}
