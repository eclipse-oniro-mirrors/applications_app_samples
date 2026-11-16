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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { add, multiply } from '../main/ets/common/Math';
import { UserService, ProductService, createProduct } from '../main/ets/common/Service';
import { UserRepository } from '../main/ets/common/Repository';
import { createUser, UserService as ModuleUserService, User as ModuleUser } from '../main/ets/common/User';
import ReportBuilder, { ReportOptions } from '../main/ets/common/Report';
import { APP_NAME, APP_LABEL, version } from '../main/ets/common/Config';
import { getFeatureLabel } from '../main/ets/common/Feature';
import { getProfileLabel } from '../main/ets/common/ProfileFeature';
import { getSettingsLabel } from '../main/ets/common/SettingsFeature';
import { User, Product } from '../main/ets/common/Types';
import {
  MAX_RETRY_COUNT, DEFAULT_TIMEOUT, buildUrl, createApiConfig, ApiConfig, RenamedUserService, RequestTracker,
  RequestStatus
} from '../main/ets/pages/ModuleSystem';

const CALC_VALUES: number[] = [-1000, -100, -7, -1, 0, 1, 2, 3, 7, 10, 50, 100, 1000, 0.5, -0.25, 1e6];
const LOOKUP_IDS: number[] = [-60, -1, 0, 1, 2, 3, 10, 100, 260];
const NAMES: string[] = ['', 'A', 'AB', 'abc', 'ArkTS', 'Product', 'xxxxxxxxxx', '中文', '12345', 'a b', 'tab\t', 'line\n'];
const STATUSES: RequestStatus[] = ['idle', 'loading', 'success', 'failed'];

export function commonLogicMatrixTest(): void {
  describe('ArkTSCommonLogicMatrixTest', () => {
    it('testCommonLogicMath0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      CALC_VALUES.forEach((left: number) => {
        CALC_VALUES.forEach((right: number) => {
          expect(add(left, right)).assertEqual(left + right);
          expect(add(right, left)).assertEqual(left + right);
          expect(multiply(left, right)).assertEqual(left * right);
          expect(multiply(right, left)).assertEqual(left * right);
        });
      });
      expect(CALC_VALUES.length).assertEqual(16);
    })

    it('testCommonLogicUserService0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const service: UserService = new UserService();
      LOOKUP_IDS.forEach((id: number) => {
        const found: User | null = service.findById(id);
        if (id <= 0) {
          expect(found).assertNull();
        } else {
          expect((found as User).id).assertEqual(id);
          expect((found as User).name).assertEqual('Alice');
        }
      });
    })

    it('testCommonLogicProduct0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const service: ProductService = new ProductService();
      NAMES.forEach((name: string) => {
        const product: Product = createProduct(name);
        expect(product.id).assertEqual(0);
        expect(product.name).assertEqual(name);
        expect(service.getName(product)).assertEqual(name);
      });
    })

    it('testCommonLogicRepository0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const repo: UserRepository = new UserRepository();
      expect(repo.list().length).assertEqual(0);
      const direct: User = { id: 7, name: 'direct' };
      repo.save(direct);
      expect(repo.list().length).assertEqual(1);
      expect(repo.list()[0].id).assertEqual(7);
      expect(repo.list()[0].name).assertEqual('direct');
      expect(repo.list()[0] === direct).assertTrue();
    })

    it('testCommonLogicUserModule0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      LOOKUP_IDS.forEach((id: number) => {
        const user: ModuleUser = createUser(id, 'user' + id.toString());
        expect(user.id).assertEqual(id);
        expect(user.name).assertEqual('user' + id.toString());
      });
      const service: ModuleUserService = new ModuleUserService();
      NAMES.forEach((name: string) => {
        service.add(createUser(1, name));
      });
      expect(service.getAll().length).assertEqual(NAMES.length);
    })

    it('testCommonLogicReport0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const builder: ReportBuilder = new ReportBuilder();
      NAMES.forEach((title: string) => {
        const options: ReportOptions = { title: title };
        expect(builder.build(options)).assertEqual(title);
        expect(builder.build(options).length).assertEqual(title.length);
      });
    })

    it('testCommonLogicLabels0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(APP_NAME).assertEqual('DemoApp');
      expect(APP_LABEL).assertEqual('DemoApp');
      expect(version).assertEqual('1.0');
      expect(getFeatureLabel()).assertEqual('feature');
      expect(getProfileLabel()).assertEqual('profile');
      expect(getSettingsLabel()).assertEqual('settings');
    })

    it('testCommonLogicModuleSystem0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(MAX_RETRY_COUNT).assertEqual(3);
      expect(DEFAULT_TIMEOUT).assertEqual(5000);
      NAMES.forEach((path: string) => {
        expect(buildUrl('http://host', path)).assertEqual('http://host' + path);
      });
      NAMES.forEach((host: string) => {
        const config: ApiConfig = createApiConfig(host);
        expect(config.host).assertEqual(host);
        expect(config.timeout).assertEqual(DEFAULT_TIMEOUT);
      });
      expect(new RenamedUserService().getName()).assertEqual('UserService');
    })

    it('testCommonLogicTracker0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      STATUSES.forEach((first: RequestStatus) => {
        STATUSES.forEach((second: RequestStatus) => {
          const tracker: RequestTracker = new RequestTracker();
          expect(tracker.getStatus()).assertEqual('idle');
          tracker.setStatus(first);
          expect(tracker.getStatus()).assertEqual(first);
          tracker.setStatus(second);
          expect(tracker.getStatus()).assertEqual(second);
          expect(new RequestTracker().getStatus()).assertEqual('idle');
        });
      });
    })
  })
}
