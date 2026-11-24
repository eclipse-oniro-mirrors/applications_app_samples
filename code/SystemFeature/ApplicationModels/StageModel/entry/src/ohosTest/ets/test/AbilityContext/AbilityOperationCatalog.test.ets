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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import { ACCOUNT_ID, RESULT_CODE, CONNECTION_NUMBER } from '../Shared/SharedDriver';

enum OperationCategory {
  APP = 0,
  SERVICE = 1,
  LIFECYCLE = 2,
  PERMISSION = 3,
  MISSION = 4
}

enum OperationId {
  START_ABILITY = 0,
  START_ABILITY_FOR_RESULT = 1,
  START_ABILITY_WITH_ACCOUNT = 2,
  START_SERVICE = 3,
  STOP_SERVICE = 4,
  CONNECT_SERVICE = 5,
  DISCONNECT_SERVICE = 6,
  REQUEST_PERMISSIONS = 7,
  SET_MISSION_LABEL = 8,
  IS_TERMINATING = 9
}

class OperationDescriptor {
  readonly id: OperationId;
  readonly name: string;
  readonly category: OperationCategory;
  readonly requiresAccount: boolean;
  readonly requiresConnection: boolean;
  readonly weight: number;
  readonly prerequisites: OperationId[];

  constructor(id: OperationId, name: string, category: OperationCategory, requiresAccount: boolean,
    requiresConnection: boolean, weight: number, prerequisites: OperationId[]) {
    this.id = id;
    this.name = name;
    this.category = category;
    this.requiresAccount = requiresAccount;
    this.requiresConnection = requiresConnection;
    this.weight = weight;
    this.prerequisites = prerequisites;
  }

  hasPrerequisites(): boolean {
    return this.prerequisites.length > 0;
  }

  dependsOn(candidate: OperationId): boolean {
    for (const id of this.prerequisites) {
      if (id === candidate) {
        return true;
      }
    }
    return false;
  }

  describe(): string {
    return `${this.id}:${this.name}[${this.category}]`;
  }
}

class OperationCatalog {
  private descriptors: OperationDescriptor[] = [];

  add(descriptor: OperationDescriptor): OperationCatalog {
    this.descriptors.push(descriptor);
    return this;
  }

  size(): number {
    return this.descriptors.length;
  }

  isEmpty(): boolean {
    return this.descriptors.length === 0;
  }

  all(): OperationDescriptor[] {
    return this.descriptors;
  }

  at(index: number): OperationDescriptor | null {
    if (index < 0 || index >= this.descriptors.length) {
      return null;
    }
    return this.descriptors[index];
  }

  countByCategory(category: OperationCategory): number {
    let count = 0;
    for (const descriptor of this.descriptors) {
      if (descriptor.category === category) {
        count += 1;
      }
    }
    return count;
  }

  findByName(name: string): OperationDescriptor | null {
    for (const descriptor of this.descriptors) {
      if (descriptor.name === name) {
        return descriptor;
      }
    }
    return null;
  }

  findById(id: OperationId): OperationDescriptor | null {
    for (const descriptor of this.descriptors) {
      if (descriptor.id === id) {
        return descriptor;
      }
    }
    return null;
  }

  names(): string[] {
    const result: string[] = [];
    for (const descriptor of this.descriptors) {
      result.push(descriptor.name);
    }
    return result;
  }

  totalWeight(): number {
    let total = 0;
    for (const descriptor of this.descriptors) {
      total += descriptor.weight;
    }
    return total;
  }

  accountOperations(): number {
    let count = 0;
    for (const descriptor of this.descriptors) {
      if (descriptor.requiresAccount) {
        count += 1;
      }
    }
    return count;
  }

  connectionOperations(): number {
    let count = 0;
    for (const descriptor of this.descriptors) {
      if (descriptor.requiresConnection) {
        count += 1;
      }
    }
    return count;
  }

  withPrerequisites(): number {
    let count = 0;
    for (const descriptor of this.descriptors) {
      if (descriptor.hasPrerequisites()) {
        count += 1;
      }
    }
    return count;
  }

  byCategory(category: OperationCategory): OperationDescriptor[] {
    const result: OperationDescriptor[] = [];
    for (const descriptor of this.descriptors) {
      if (descriptor.category === category) {
        result.push(descriptor);
      }
    }
    return result;
  }
}

class CatalogIndex {
  private names: string[] = [];
  private ids: OperationId[] = [];

  build(catalog: OperationCatalog): CatalogIndex {
    for (const descriptor of catalog.all()) {
      this.names.push(descriptor.name);
      this.ids.push(descriptor.id);
    }
    return this;
  }

  size(): number {
    return this.names.length;
  }

  nameAt(index: number): string {
    if (index < 0 || index >= this.names.length) {
      return '';
    }
    return this.names[index];
  }

  idAt(index: number): OperationId {
    if (index < 0 || index >= this.ids.length) {
      return OperationId.START_ABILITY;
    }
    return this.ids[index];
  }

  contains(name: string): boolean {
    for (const candidate of this.names) {
      if (candidate === name) {
        return true;
      }
    }
    return false;
  }

  indexOf(name: string): number {
    for (let i = 0; i < this.names.length; i++) {
      if (this.names[i] === name) {
        return i;
      }
    }
    return -1;
  }

  duplicateCount(): number {
    let duplicates = 0;
    for (let i = 0; i < this.names.length; i++) {
      for (let j = i + 1; j < this.names.length; j++) {
        if (this.names[i] === this.names[j]) {
          duplicates += 1;
        }
      }
    }
    return duplicates;
  }
}

class CatalogQuery {
  private catalog: OperationCatalog;
  private categoryFilter: OperationCategory | null = null;
  private accountOnly: boolean = false;
  private connectionOnly: boolean = false;
  private minWeight: number = 0;

  constructor(catalog: OperationCatalog) {
    this.catalog = catalog;
  }

  inCategory(category: OperationCategory): CatalogQuery {
    this.categoryFilter = category;
    return this;
  }

  requireAccount(): CatalogQuery {
    this.accountOnly = true;
    return this;
  }

  requireConnection(): CatalogQuery {
    this.connectionOnly = true;
    return this;
  }

  weightAtLeast(weight: number): CatalogQuery {
    this.minWeight = weight;
    return this;
  }

  execute(): OperationDescriptor[] {
    const matches: OperationDescriptor[] = [];
    for (const descriptor of this.catalog.all()) {
      if (this.categoryFilter !== null && descriptor.category !== this.categoryFilter) {
        continue;
      }
      if (this.accountOnly && !descriptor.requiresAccount) {
        continue;
      }
      if (this.connectionOnly && !descriptor.requiresConnection) {
        continue;
      }
      if (descriptor.weight < this.minWeight) {
        continue;
      }
      matches.push(descriptor);
    }
    return matches;
  }

  count(): number {
    return this.execute().length;
  }

  names(): string[] {
    const result: string[] = [];
    for (const descriptor of this.execute()) {
      result.push(descriptor.name);
    }
    return result;
  }
}

class CatalogScheduler {
  private catalog: OperationCatalog;

  constructor(catalog: OperationCatalog) {
    this.catalog = catalog;
  }

  private prerequisitesMet(descriptor: OperationDescriptor, satisfied: OperationId[]): boolean {
    for (const prerequisite of descriptor.prerequisites) {
      let met = false;
      for (const done of satisfied) {
        if (done === prerequisite) {
          met = true;
        }
      }
      if (!met) {
        return false;
      }
    }
    return true;
  }

  scheduleOrder(): OperationDescriptor[] {
    const satisfied: OperationId[] = [];
    const remaining: OperationDescriptor[] = [];
    for (const descriptor of this.catalog.all()) {
      remaining.push(descriptor);
    }
    const ordered: OperationDescriptor[] = [];
    let progress = true;
    while (progress) {
      progress = false;
      for (let i = 0; i < remaining.length; i++) {
        const descriptor = remaining[i];
        if (this.prerequisitesMet(descriptor, satisfied)) {
          ordered.push(descriptor);
          satisfied.push(descriptor.id);
          remaining.splice(i, 1);
          progress = true;
          break;
        }
      }
    }
    return ordered;
  }

  isFullySchedulable(): boolean {
    return this.scheduleOrder().length === this.catalog.size();
  }

  blockedCount(): number {
    return this.catalog.size() - this.scheduleOrder().length;
  }
}

class CatalogReport {
  private catalog: OperationCatalog;

  constructor(catalog: OperationCatalog) {
    this.catalog = catalog;
  }

  describe(): string {
    return `ops=${this.catalog.size()},weight=${this.catalog.totalWeight()}`;
  }

  categorySummary(): string {
    return `${this.catalog.countByCategory(OperationCategory.APP)}/` +
      `${this.catalog.countByCategory(OperationCategory.SERVICE)}/` +
      `${this.catalog.countByCategory(OperationCategory.LIFECYCLE)}/` +
      `${this.catalog.countByCategory(OperationCategory.PERMISSION)}/` +
      `${this.catalog.countByCategory(OperationCategory.MISSION)}`;
  }

  averageWeight(): number {
    const size = this.catalog.size();
    if (size === 0) {
      return 0;
    }
    return this.catalog.totalWeight() / size;
  }

  heaviest(): OperationDescriptor | null {
    let result: OperationDescriptor | null = null;
    for (const descriptor of this.catalog.all()) {
      if (result === null || descriptor.weight > result.weight) {
        result = descriptor;
      }
    }
    return result;
  }

  categoryCounts(): number[] {
    const counts: number[] = [];
    const categories: OperationCategory[] = [OperationCategory.APP, OperationCategory.SERVICE,
      OperationCategory.LIFECYCLE, OperationCategory.PERMISSION, OperationCategory.MISSION];
    for (const category of categories) {
      counts.push(this.catalog.countByCategory(category));
    }
    return counts;
  }
}

function buildCatalog(): OperationCatalog {
  const catalog = new OperationCatalog();
  catalog.add(new OperationDescriptor(OperationId.START_ABILITY, 'startAbility',
    OperationCategory.APP, false, false, 1, []));
  catalog.add(new OperationDescriptor(OperationId.START_ABILITY_FOR_RESULT, 'startAbilityForResult',
    OperationCategory.APP, false, false, 2, [OperationId.START_ABILITY]));
  catalog.add(new OperationDescriptor(OperationId.START_ABILITY_WITH_ACCOUNT, 'startAbilityWithAccount',
    OperationCategory.APP, true, false, 2, [OperationId.START_ABILITY]));
  catalog.add(new OperationDescriptor(OperationId.START_SERVICE, 'startServiceExtensionAbility',
    OperationCategory.SERVICE, false, false, 3, []));
  catalog.add(new OperationDescriptor(OperationId.STOP_SERVICE, 'stopServiceExtensionAbility',
    OperationCategory.SERVICE, false, false, 3, [OperationId.START_SERVICE]));
  catalog.add(new OperationDescriptor(OperationId.CONNECT_SERVICE, 'connectServiceExtensionAbility',
    OperationCategory.SERVICE, false, true, 3, []));
  catalog.add(new OperationDescriptor(OperationId.DISCONNECT_SERVICE, 'disconnectServiceExtensionAbility',
    OperationCategory.SERVICE, false, true, 3, [OperationId.CONNECT_SERVICE]));
  catalog.add(new OperationDescriptor(OperationId.REQUEST_PERMISSIONS, 'requestPermissionsFromUser',
    OperationCategory.PERMISSION, false, false, 2, []));
  catalog.add(new OperationDescriptor(OperationId.SET_MISSION_LABEL, 'setMissionLabel',
    OperationCategory.MISSION, false, false, 1, []));
  catalog.add(new OperationDescriptor(OperationId.IS_TERMINATING, 'isTerminating',
    OperationCategory.LIFECYCLE, false, false, 1, []));
  return catalog;
}

export default function abilityOperationCatalogTest(): void {
  describe('AbilityOperationCatalogSuite', () => {
    let catalog: OperationCatalog = buildCatalog();

    beforeAll(() => {
      catalog = buildCatalog();
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'operation catalog suite start');
    });

    afterAll(() => {
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'operation catalog suite end');
    });

    it('AbilityOperationCatalog_001', 0, async (done: Function) => {
      expect(catalog.size()).assertEqual(10);
      expect(catalog.isEmpty()).assertFalse();
      expect(catalog.all().length).assertEqual(10);
      done();
    });

    it('AbilityOperationCatalog_002', 0, async (done: Function) => {
      expect(catalog.countByCategory(OperationCategory.APP)).assertEqual(3);
      expect(catalog.countByCategory(OperationCategory.SERVICE)).assertEqual(4);
      expect(catalog.countByCategory(OperationCategory.LIFECYCLE)).assertEqual(1);
      expect(catalog.countByCategory(OperationCategory.PERMISSION)).assertEqual(1);
      expect(catalog.countByCategory(OperationCategory.MISSION)).assertEqual(1);
      done();
    });

    it('AbilityOperationCatalog_003', 0, async (done: Function) => {
      expect(catalog.totalWeight()).assertEqual(21);
      expect(catalog.accountOperations()).assertEqual(1);
      expect(catalog.connectionOperations()).assertEqual(2);
      expect(catalog.withPrerequisites()).assertEqual(4);
      done();
    });

    it('AbilityOperationCatalog_004', 0, async (done: Function) => {
      const first = catalog.at(0);
      expect(first !== null).assertTrue();
      if (first !== null) {
        expect(first.name).assertEqual('startAbility');
        expect(first.category).assertEqual(OperationCategory.APP);
        expect(first.weight).assertEqual(1);
        expect(first.hasPrerequisites()).assertFalse();
      }
      done();
    });

    it('AbilityOperationCatalog_005', 0, async (done: Function) => {
      expect(catalog.at(-1)).assertNull();
      expect(catalog.at(10)).assertNull();
      expect(catalog.at(11)).assertNull();
      done();
    });

    it('AbilityOperationCatalog_006', 0, async (done: Function) => {
      const found = catalog.findByName('connectServiceExtensionAbility');
      expect(found !== null).assertTrue();
      if (found !== null) {
        expect(found.id).assertEqual(OperationId.CONNECT_SERVICE);
        expect(found.requiresConnection).assertTrue();
        expect(found.requiresAccount).assertFalse();
      }
      expect(catalog.findByName('missing')).assertNull();
      done();
    });

    it('AbilityOperationCatalog_007', 0, async (done: Function) => {
      const found = catalog.findById(OperationId.START_ABILITY_WITH_ACCOUNT);
      expect(found !== null).assertTrue();
      if (found !== null) {
        expect(found.requiresAccount).assertTrue();
        expect(found.dependsOn(OperationId.START_ABILITY)).assertTrue();
      }
      done();
    });

    it('AbilityOperationCatalog_008', 0, async (done: Function) => {
      const names = catalog.names();
      expect(names.length).assertEqual(10);
      expect(names[0]).assertEqual('startAbility');
      expect(names[9]).assertEqual('isTerminating');
      done();
    });

    it('AbilityOperationCatalog_009', 0, async (done: Function) => {
      const app = catalog.byCategory(OperationCategory.APP);
      expect(app.length).assertEqual(3);
      expect(app[0].name).assertEqual('startAbility');
      expect(app[2].name).assertEqual('startAbilityWithAccount');
      done();
    });

    it('AbilityOperationCatalog_010', 0, async (done: Function) => {
      const service = catalog.byCategory(OperationCategory.SERVICE);
      expect(service.length).assertEqual(4);
      expect(service[0].name).assertEqual('startServiceExtensionAbility');
      expect(service[3].name).assertEqual('disconnectServiceExtensionAbility');
      done();
    });

    it('AbilityOperationCatalog_011', 0, async (done: Function) => {
      const descriptor = new OperationDescriptor(OperationId.START_ABILITY, 'startAbility',
        OperationCategory.APP, false, false, 1, []);
      expect(descriptor.describe()).assertEqual(`0:startAbility[${OperationCategory.APP}]`);
      expect(descriptor.hasPrerequisites()).assertFalse();
      done();
    });

    it('AbilityOperationCatalog_012', 0, async (done: Function) => {
      const descriptor = new OperationDescriptor(OperationId.DISCONNECT_SERVICE, 'disconnectServiceExtensionAbility',
        OperationCategory.SERVICE, false, true, 3, [OperationId.CONNECT_SERVICE]);
      expect(descriptor.hasPrerequisites()).assertTrue();
      expect(descriptor.dependsOn(OperationId.CONNECT_SERVICE)).assertTrue();
      expect(descriptor.dependsOn(OperationId.START_SERVICE)).assertFalse();
      done();
    });

    it('AbilityOperationCatalog_013', 0, async (done: Function) => {
      const index = new CatalogIndex().build(catalog);
      expect(index.size()).assertEqual(10);
      expect(index.nameAt(0)).assertEqual('startAbility');
      expect(index.nameAt(9)).assertEqual('isTerminating');
      expect(index.idAt(0)).assertEqual(OperationId.START_ABILITY);
      done();
    });

    it('AbilityOperationCatalog_014', 0, async (done: Function) => {
      const index = new CatalogIndex().build(catalog);
      expect(index.contains('startAbility')).assertTrue();
      expect(index.contains('missing')).assertFalse();
      expect(index.indexOf('startAbility')).assertEqual(0);
      expect(index.indexOf('missing')).assertEqual(-1);
      expect(index.duplicateCount()).assertEqual(0);
      done();
    });

    it('AbilityOperationCatalog_015', 0, async (done: Function) => {
      const index = new CatalogIndex().build(catalog);
      expect(index.nameAt(-1)).assertEqual('');
      expect(index.nameAt(99)).assertEqual('');
      expect(index.idAt(99)).assertEqual(OperationId.START_ABILITY);
      done();
    });

    it('AbilityOperationCatalog_016', 0, async (done: Function) => {
      const query = new CatalogQuery(catalog);
      expect(query.count()).assertEqual(10);
      expect(query.names().length).assertEqual(10);
      done();
    });

    it('AbilityOperationCatalog_017', 0, async (done: Function) => {
      const query = new CatalogQuery(catalog).inCategory(OperationCategory.SERVICE);
      expect(query.count()).assertEqual(4);
      const names = query.names();
      expect(names[0]).assertEqual('startServiceExtensionAbility');
      expect(names[3]).assertEqual('disconnectServiceExtensionAbility');
      done();
    });

    it('AbilityOperationCatalog_018', 0, async (done: Function) => {
      const query = new CatalogQuery(catalog).requireAccount();
      expect(query.count()).assertEqual(1);
      expect(query.names()[0]).assertEqual('startAbilityWithAccount');
      done();
    });

    it('AbilityOperationCatalog_019', 0, async (done: Function) => {
      const query = new CatalogQuery(catalog).requireConnection();
      expect(query.count()).assertEqual(2);
      expect(query.names()[0]).assertEqual('connectServiceExtensionAbility');
      expect(query.names()[1]).assertEqual('disconnectServiceExtensionAbility');
      done();
    });

    it('AbilityOperationCatalog_020', 0, async (done: Function) => {
      const query = new CatalogQuery(catalog).weightAtLeast(3);
      expect(query.count()).assertEqual(4);
      done();
    });

    it('AbilityOperationCatalog_021', 0, async (done: Function) => {
      const query = new CatalogQuery(catalog).inCategory(OperationCategory.SERVICE).weightAtLeast(3);
      expect(query.count()).assertEqual(4);
      const combined = new CatalogQuery(catalog).requireConnection().requireAccount();
      expect(combined.count()).assertEqual(0);
      done();
    });

    it('AbilityOperationCatalog_022', 0, async (done: Function) => {
      const query = new CatalogQuery(catalog).weightAtLeast(50);
      expect(query.count()).assertEqual(0);
      expect(query.names().length).assertEqual(0);
      done();
    });

    it('AbilityOperationCatalog_023', 0, async (done: Function) => {
      const scheduler = new CatalogScheduler(catalog);
      const order = scheduler.scheduleOrder();
      expect(order.length).assertEqual(10);
      expect(scheduler.isFullySchedulable()).assertTrue();
      expect(scheduler.blockedCount()).assertEqual(0);
      done();
    });

    it('AbilityOperationCatalog_024', 0, async (done: Function) => {
      const scheduler = new CatalogScheduler(catalog);
      const order = scheduler.scheduleOrder();
      const index = new CatalogIndex().build(catalog);
      const orderedNames: string[] = [];
      for (const descriptor of order) {
        orderedNames.push(descriptor.name);
      }
      expect(index.contains(orderedNames[0])).assertTrue();
      let startIndex = -1;
      let forResultIndex = -1;
      for (let i = 0; i < orderedNames.length; i++) {
        if (orderedNames[i] === 'startAbility') {
          startIndex = i;
        }
        if (orderedNames[i] === 'startAbilityForResult') {
          forResultIndex = i;
        }
      }
      expect(startIndex).assertLess(forResultIndex);
      done();
    });

    it('AbilityOperationCatalog_025', 0, async (done: Function) => {
      const scheduler = new CatalogScheduler(catalog);
      const order = scheduler.scheduleOrder();
      const names: string[] = [];
      for (const descriptor of order) {
        names.push(descriptor.name);
      }
      let connectIndex = -1;
      let disconnectIndex = -1;
      for (let i = 0; i < names.length; i++) {
        if (names[i] === 'connectServiceExtensionAbility') {
          connectIndex = i;
        }
        if (names[i] === 'disconnectServiceExtensionAbility') {
          disconnectIndex = i;
        }
      }
      expect(connectIndex).assertLess(disconnectIndex);
      done();
    });

    it('AbilityOperationCatalog_026', 0, async (done: Function) => {
      const cyclic = new OperationCatalog();
      cyclic.add(new OperationDescriptor(OperationId.START_ABILITY, 'a', OperationCategory.APP, false, false, 1,
        [OperationId.STOP_SERVICE]));
      cyclic.add(new OperationDescriptor(OperationId.STOP_SERVICE, 'b', OperationCategory.SERVICE, false, false, 1,
        [OperationId.START_ABILITY]));
      const scheduler = new CatalogScheduler(cyclic);
      expect(scheduler.isFullySchedulable()).assertFalse();
      expect(scheduler.blockedCount()).assertEqual(2);
      expect(scheduler.scheduleOrder().length).assertEqual(0);
      done();
    });

    it('AbilityOperationCatalog_027', 0, async (done: Function) => {
      const partial = new OperationCatalog();
      partial.add(new OperationDescriptor(OperationId.START_ABILITY, 'a', OperationCategory.APP, false, false, 1, []));
      partial.add(new OperationDescriptor(OperationId.STOP_SERVICE, 'b', OperationCategory.SERVICE, false, false, 1,
        [OperationId.CONNECT_SERVICE]));
      const scheduler = new CatalogScheduler(partial);
      expect(scheduler.scheduleOrder().length).assertEqual(1);
      expect(scheduler.blockedCount()).assertEqual(1);
      expect(scheduler.isFullySchedulable()).assertFalse();
      done();
    });

    it('AbilityOperationCatalog_028', 0, async (done: Function) => {
      const report = new CatalogReport(catalog);
      expect(report.describe()).assertEqual('ops=10,weight=21');
      expect(report.categorySummary()).assertEqual('3/4/1/1/1');
      expect(report.averageWeight()).assertEqual(2.1);
      done();
    });

    it('AbilityOperationCatalog_029', 0, async (done: Function) => {
      const report = new CatalogReport(catalog);
      const heaviest = report.heaviest();
      expect(heaviest !== null).assertTrue();
      if (heaviest !== null) {
        expect(heaviest.weight).assertEqual(3);
      }
      const counts = report.categoryCounts();
      expect(counts.length).assertEqual(5);
      expect(counts[0]).assertEqual(3);
      expect(counts[1]).assertEqual(4);
      done();
    });

    it('AbilityOperationCatalog_030', 0, async (done: Function) => {
      const empty = new OperationCatalog();
      expect(empty.size()).assertEqual(0);
      expect(empty.isEmpty()).assertTrue();
      expect(empty.totalWeight()).assertEqual(0);
      expect(empty.accountOperations()).assertEqual(0);
      expect(empty.connectionOperations()).assertEqual(0);
      done();
    });

    it('AbilityOperationCatalog_031', 0, async (done: Function) => {
      const empty = new OperationCatalog();
      const report = new CatalogReport(empty);
      expect(report.averageWeight()).assertEqual(0);
      expect(report.heaviest()).assertNull();
      expect(report.describe()).assertEqual('ops=0,weight=0');
      done();
    });

    it('AbilityOperationCatalog_032', 0, async (done: Function) => {
      const emptyQuery = new CatalogQuery(new OperationCatalog());
      expect(emptyQuery.count()).assertEqual(0);
      expect(emptyQuery.names().length).assertEqual(0);
      done();
    });

    it('AbilityOperationCatalog_033', 0, async (done: Function) => {
      let weightSum = 0;
      for (const descriptor of catalog.all()) {
        weightSum += descriptor.weight;
      }
      expect(weightSum).assertEqual(catalog.totalWeight());
      expect(weightSum).assertEqual(21);
      done();
    });

    it('AbilityOperationCatalog_034', 0, async (done: Function) => {
      let accountScoped = 0;
      let connectionScoped = 0;
      for (const descriptor of catalog.all()) {
        if (descriptor.requiresAccount) {
          accountScoped += 1;
        }
        if (descriptor.requiresConnection) {
          connectionScoped += 1;
        }
      }
      expect(accountScoped).assertEqual(1);
      expect(connectionScoped).assertEqual(2);
      done();
    });

    it('AbilityOperationCatalog_035', 0, async (done: Function) => {
      const appNames = catalog.byCategory(OperationCategory.APP).map((descriptor: OperationDescriptor) => descriptor.name);
      expect(appNames.length).assertEqual(3);
      expect(appNames[0]).assertEqual('startAbility');
      expect(appNames[1]).assertEqual('startAbilityForResult');
      expect(appNames[2]).assertEqual('startAbilityWithAccount');
      done();
    });

    it('AbilityOperationCatalog_036', 0, async (done: Function) => {
      const lifecycle = catalog.byCategory(OperationCategory.LIFECYCLE);
      expect(lifecycle.length).assertEqual(1);
      expect(lifecycle[0].name).assertEqual('isTerminating');
      expect(lifecycle[0].weight).assertEqual(1);
      done();
    });

    it('AbilityOperationCatalog_037', 0, async (done: Function) => {
      const mission = catalog.byCategory(OperationCategory.MISSION);
      expect(mission.length).assertEqual(1);
      expect(mission[0].name).assertEqual('setMissionLabel');
      expect(mission[0].hasPrerequisites()).assertFalse();
      done();
    });

    it('AbilityOperationCatalog_038', 0, async (done: Function) => {
      const names = catalog.names();
      let unique = true;
      for (let i = 0; i < names.length; i++) {
        for (let j = i + 1; j < names.length; j++) {
          if (names[i] === names[j]) {
            unique = false;
          }
        }
      }
      expect(unique).assertTrue();
      done();
    });

    it('AbilityOperationCatalog_039', 0, async (done: Function) => {
      const prerequisites = catalog.all().filter((descriptor: OperationDescriptor) => descriptor.hasPrerequisites());
      expect(prerequisites.length).assertEqual(4);
      done();
    });

    it('AbilityOperationCatalog_040', 0, async (done: Function) => {
      const noPrerequisites = catalog.all().filter((descriptor: OperationDescriptor) => !descriptor.hasPrerequisites());
      expect(noPrerequisites.length).assertEqual(6);
      done();
    });

    it('AbilityOperationCatalog_041', 0, async (done: Function) => {
      let idSum = 0;
      for (const descriptor of catalog.all()) {
        idSum += descriptor.id;
      }
      expect(idSum).assertEqual(45);
      done();
    });

    it('AbilityOperationCatalog_042', 0, async (done: Function) => {
      const query = new CatalogQuery(catalog).inCategory(OperationCategory.APP).requireAccount();
      expect(query.count()).assertEqual(1);
      expect(query.names()[0]).assertEqual('startAbilityWithAccount');
      done();
    });

    it('AbilityOperationCatalog_043', 0, async (done: Function) => {
      const order = new CatalogScheduler(catalog).scheduleOrder();
      let startIndex = -1;
      let withAccountIndex = -1;
      for (let i = 0; i < order.length; i++) {
        if (order[i].id === OperationId.START_ABILITY) {
          startIndex = i;
        }
        if (order[i].id === OperationId.START_ABILITY_WITH_ACCOUNT) {
          withAccountIndex = i;
        }
      }
      expect(startIndex).assertLarger(-1);
      expect(withAccountIndex).assertLarger(startIndex);
      done();
    });

    it('AbilityOperationCatalog_044', 0, async (done: Function) => {
      const order = new CatalogScheduler(catalog).scheduleOrder();
      const satisfied: OperationId[] = [];
      let valid = true;
      for (const descriptor of order) {
        for (const prerequisite of descriptor.prerequisites) {
          let met = false;
          for (const doneId of satisfied) {
            if (doneId === prerequisite) {
              met = true;
            }
          }
          if (!met) {
            valid = false;
          }
        }
        satisfied.push(descriptor.id);
      }
      expect(valid).assertTrue();
      expect(satisfied.length).assertEqual(10);
      done();
    });

    it('AbilityOperationCatalog_045', 0, async (done: Function) => {
      const report = new CatalogReport(catalog);
      expect(report.averageWeight()).assertEqual(catalog.totalWeight() / catalog.size());
      const heaviest = report.heaviest();
      expect(heaviest !== null).assertTrue();
      if (heaviest !== null) {
        expect(heaviest.weight).assertEqual(3);
        expect(heaviest.category).assertEqual(OperationCategory.SERVICE);
      }
      done();
    });

    it('AbilityOperationCatalog_046', 0, async (done: Function) => {
      const index = new CatalogIndex();
      const duplicated = new OperationCatalog();
      duplicated.add(new OperationDescriptor(OperationId.START_ABILITY, 'dup', OperationCategory.APP, false, false, 1, []));
      duplicated.add(new OperationDescriptor(OperationId.STOP_SERVICE, 'dup', OperationCategory.SERVICE, false, false, 1, []));
      index.build(duplicated);
      expect(index.size()).assertEqual(2);
      expect(index.duplicateCount()).assertEqual(1);
      done();
    });

    it('AbilityOperationCatalog_047', 0, async (done: Function) => {
      const single = new OperationCatalog();
      single.add(new OperationDescriptor(OperationId.SET_MISSION_LABEL, 'setMissionLabel',
        OperationCategory.MISSION, false, false, 1, []));
      const report = new CatalogReport(single);
      expect(report.describe()).assertEqual('ops=1,weight=1');
      expect(report.averageWeight()).assertEqual(1);
      expect(report.heaviest() !== null).assertTrue();
      done();
    });

    it('AbilityOperationCatalog_048', 0, async (done: Function) => {
      const catalog2 = new OperationCatalog();
      catalog2.add(new OperationDescriptor(OperationId.START_ABILITY, 'a', OperationCategory.APP, false, false, 2, []));
      catalog2.add(new OperationDescriptor(OperationId.STOP_SERVICE, 'b', OperationCategory.SERVICE, false, false, 5, []));
      catalog2.add(new OperationDescriptor(OperationId.SET_MISSION_LABEL, 'c', OperationCategory.MISSION, false, false, 3, []));
      const report = new CatalogReport(catalog2);
      const heaviest = report.heaviest();
      expect(heaviest !== null).assertTrue();
      if (heaviest !== null) {
        expect(heaviest.name).assertEqual('b');
        expect(heaviest.weight).assertEqual(5);
      }
      expect(report.averageWeight()).assertEqual(10 / 3);
      done();
    });

    it('AbilityOperationCatalog_049', 0, async (done: Function) => {
      let app = 0;
      let service = 0;
      let lifecycle = 0;
      let permission = 0;
      let mission = 0;
      for (const descriptor of catalog.all()) {
        if (descriptor.category === OperationCategory.APP) {
          app += 1;
        }
        if (descriptor.category === OperationCategory.SERVICE) {
          service += 1;
        }
        if (descriptor.category === OperationCategory.LIFECYCLE) {
          lifecycle += 1;
        }
        if (descriptor.category === OperationCategory.PERMISSION) {
          permission += 1;
        }
        if (descriptor.category === OperationCategory.MISSION) {
          mission += 1;
        }
      }
      expect(app + service + lifecycle + permission + mission).assertEqual(catalog.size());
      expect(permission).assertEqual(1);
      done();
    });

    it('AbilityOperationCatalog_050', 0, async (done: Function) => {
      const forResult = catalog.findByName('startAbilityForResult');
      expect(forResult !== null).assertTrue();
      if (forResult !== null) {
        expect(forResult.weight).assertEqual(2);
        expect(forResult.dependsOn(OperationId.START_ABILITY)).assertTrue();
        expect(forResult.prerequisites.length).assertEqual(1);
      }
      done();
    });

    it('AbilityOperationCatalog_051', 0, async (done: Function) => {
      const stop = catalog.findByName('stopServiceExtensionAbility');
      expect(stop !== null).assertTrue();
      if (stop !== null) {
        expect(stop.dependsOn(OperationId.START_SERVICE)).assertTrue();
        expect(stop.requiresConnection).assertFalse();
        expect(stop.category).assertEqual(OperationCategory.SERVICE);
      }
      done();
    });

    it('AbilityOperationCatalog_052', 0, async (done: Function) => {
      const permission = catalog.findByName('requestPermissionsFromUser');
      expect(permission !== null).assertTrue();
      if (permission !== null) {
        expect(permission.id).assertEqual(OperationId.REQUEST_PERMISSIONS);
        expect(permission.category).assertEqual(OperationCategory.PERMISSION);
        expect(permission.requiresAccount).assertFalse();
      }
      done();
    });

    it('AbilityOperationCatalog_053', 0, async (done: Function) => {
      const query = new CatalogQuery(catalog).inCategory(OperationCategory.LIFECYCLE);
      expect(query.count()).assertEqual(1);
      expect(query.names()[0]).assertEqual('isTerminating');
      const missionQuery = new CatalogQuery(catalog).inCategory(OperationCategory.MISSION);
      expect(missionQuery.count()).assertEqual(1);
      done();
    });

    it('AbilityOperationCatalog_054', 0, async (done: Function) => {
      const query = new CatalogQuery(catalog).inCategory(OperationCategory.PERMISSION).weightAtLeast(2);
      expect(query.count()).assertEqual(1);
      const none = new CatalogQuery(catalog).inCategory(OperationCategory.PERMISSION).weightAtLeast(3);
      expect(none.count()).assertEqual(0);
      done();
    });

    it('AbilityOperationCatalog_055', 0, async (done: Function) => {
      const connectionOrder = new CatalogQuery(catalog).requireConnection().names();
      const fullOrder = new CatalogScheduler(catalog).scheduleOrder();
      const orderedNames: string[] = [];
      for (const descriptor of fullOrder) {
        orderedNames.push(descriptor.name);
      }
      let connectIndex = -1;
      let disconnectIndex = -1;
      for (let i = 0; i < orderedNames.length; i++) {
        if (orderedNames[i] === connectionOrder[0]) {
          connectIndex = i;
        }
        if (orderedNames[i] === connectionOrder[1]) {
          disconnectIndex = i;
        }
      }
      expect(connectIndex).assertLess(disconnectIndex);
      done();
    });

    it('AbilityOperationCatalog_056', 0, async (done: Function) => {
      const single = new OperationCatalog();
      single.add(new OperationDescriptor(OperationId.START_ABILITY, 'a', OperationCategory.APP, false, false, 1, []));
      const scheduler = new CatalogScheduler(single);
      expect(scheduler.isFullySchedulable()).assertTrue();
      expect(scheduler.scheduleOrder().length).assertEqual(1);
      expect(scheduler.blockedCount()).assertEqual(0);
      done();
    });

    it('AbilityOperationCatalog_057', 0, async (done: Function) => {
      const index = new CatalogIndex().build(catalog);
      expect(index.idAt(3)).assertEqual(OperationId.START_SERVICE);
      expect(index.idAt(5)).assertEqual(OperationId.CONNECT_SERVICE);
      expect(index.idAt(7)).assertEqual(OperationId.REQUEST_PERMISSIONS);
      expect(index.nameAt(7)).assertEqual('requestPermissionsFromUser');
      done();
    });

    it('AbilityOperationCatalog_058', 0, async (done: Function) => {
      const counts = new CatalogReport(catalog).categoryCounts();
      let sum = 0;
      for (const count of counts) {
        sum += count;
      }
      expect(sum).assertEqual(catalog.size());
      expect(counts.length).assertEqual(5);
      done();
    });
  });
}




