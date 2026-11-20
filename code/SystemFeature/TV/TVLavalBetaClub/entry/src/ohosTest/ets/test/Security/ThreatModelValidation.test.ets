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

import { describe, it, expect } from '@ohos/hypium';

const SEVERITY_LOW: string = 'low';

const SEVERITY_MEDIUM: string = 'medium';

const SEVERITY_HIGH: string = 'high';

const SEVERITY_CRITICAL: string = 'critical';

const CATEGORY_DATA: string = 'data';

const CATEGORY_NETWORK: string = 'network';

const CATEGORY_INPUT: string = 'input';

const CATEGORY_STORAGE: string = 'storage';

const CATEGORY_PERMISSION: string = 'permission';

const MAX_THREATS: number = 32;

interface Threat {
  id: string;
  category: string;
  severity: string;
  mitigated: boolean;
  mitigation: string;
}

// Tracks identified threats and their mitigation state
class ThreatModel {
  private threats: Map<string, Threat> = new Map<string, Threat>();

  public add(id: string, category: string, severity: string, mitigation: string): boolean {
    if (id.length === 0 || this.threats.has(id) || this.threats.size >= MAX_THREATS) {
      return false;
    }
    if (!ThreatModel.isSeverityValid(severity) || !ThreatModel.isCategoryValid(category)) {
      return false;
    }
    this.threats.set(id, {
      id: id,
      category: category,
      severity: severity,
      mitigated: mitigation.length > 0,
      mitigation: mitigation
    });
    return true;
  }

  public static isSeverityValid(severity: string): boolean {
    return severity === SEVERITY_LOW || severity === SEVERITY_MEDIUM ||
      severity === SEVERITY_HIGH || severity === SEVERITY_CRITICAL;
  }

  public static isCategoryValid(category: string): boolean {
    return category === CATEGORY_DATA || category === CATEGORY_NETWORK ||
      category === CATEGORY_INPUT || category === CATEGORY_STORAGE ||
      category === CATEGORY_PERMISSION;
  }

  public size(): number {
    return this.threats.size;
  }

  public mitigatedCount(): number {
    let count: number = 0;
    this.threats.forEach((threat: Threat) => {
      if (threat.mitigated) {
        count++;
      }
    });
    return count;
  }

  public unmitigated(): Threat[] {
    const result: Threat[] = [];
    this.threats.forEach((threat: Threat) => {
      if (!threat.mitigated) {
        result.push(threat);
      }
    });
    return result;
  }

  public bySeverity(severity: string): Threat[] {
    const result: Threat[] = [];
    this.threats.forEach((threat: Threat) => {
      if (threat.severity === severity) {
        result.push(threat);
      }
    });
    return result;
  }

  public byCategory(category: string): Threat[] {
    const result: Threat[] = [];
    this.threats.forEach((threat: Threat) => {
      if (threat.category === category) {
        result.push(threat);
      }
    });
    return result;
  }

  public hasCriticalUnmitigated(): boolean {
    return this.bySeverity(SEVERITY_CRITICAL).some((threat: Threat) => !threat.mitigated);
  }

  public coverage(): number {
    return this.threats.size === 0 ? 0 : this.mitigatedCount() * 100 / this.threats.size;
  }

  public get(id: string): Threat | undefined {
    return this.threats.get(id);
  }

  public clear(): void {
    this.threats = new Map<string, Threat>();
  }
}

// Builds the default threat model for the issue reporter
class ThreatModelFactory {
  public static build(): ThreatModel {
    const model = new ThreatModel();
    model.add('T-01', CATEGORY_INPUT, SEVERITY_HIGH, 'sanitize description and strip html');
    model.add('T-02', CATEGORY_DATA, SEVERITY_CRITICAL, 'mask phone and udid before upload');
    model.add('T-03', CATEGORY_NETWORK, SEVERITY_HIGH, 'https only and host allowlist');
    model.add('T-04', CATEGORY_STORAGE, SEVERITY_MEDIUM, 'encrypt sensitive keys');
    model.add('T-05', CATEGORY_PERMISSION, SEVERITY_MEDIUM, 'request media permissions on demand');
    return model;
  }

  public static withGap(): ThreatModel {
    const model = ThreatModelFactory.build();
    model.add('T-06', CATEGORY_NETWORK, SEVERITY_CRITICAL, '');
    return model;
  }

  public static expectedCategories(): string[] {
    return [CATEGORY_INPUT, CATEGORY_DATA, CATEGORY_NETWORK, CATEGORY_STORAGE, CATEGORY_PERMISSION];
  }
}

// Plans mitigations for unmitigated threats
class MitigationPlan {
  private items: Threat[] = [];

  public build(threats: Threat[]): void {
    this.items = [];
    for (let i = 0; i < threats.length; i++) {
      this.items.push(threats[i]);
    }
  }

  public count(): number {
    return this.items.length;
  }

  public ids(): string[] {
    return this.items.map((threat: Threat) => threat.id);
  }

  public contains(id: string): boolean {
    for (let i = 0; i < this.items.length; i++) {
      if (this.items[i].id === id) {
        return true;
      }
    }
    return false;
  }

  public hasCritical(): boolean {
    for (let i = 0; i < this.items.length; i++) {
      if (this.items[i].severity === SEVERITY_CRITICAL) {
        return true;
      }
    }
    return false;
  }

  public isReady(): boolean {
    return this.items.length === 0;
  }

  public clear(): void {
    this.items = [];
  }
}

export default function threatModelValidationTest() {
  describe('ThreatModelValidation_Test', () => {

    it('model_should_add_threats', 0, () => {
      const model = new ThreatModel();
      expect(model.add('T-01', CATEGORY_INPUT, SEVERITY_HIGH, 'sanitize')).assertTrue();
      expect(model.add('T-01', CATEGORY_INPUT, SEVERITY_HIGH, 'sanitize')).assertFalse();
      expect(model.add('', CATEGORY_INPUT, SEVERITY_HIGH, 'sanitize')).assertFalse();
      expect(model.size()).assertEqual(1);
      expect(model.get('T-01') !== undefined).assertTrue();
      expect(model.get('missing') === undefined).assertTrue();
    });

    it('model_should_validate_severity', 0, () => {
      expect(ThreatModel.isSeverityValid(SEVERITY_LOW)).assertTrue();
      expect(ThreatModel.isSeverityValid(SEVERITY_MEDIUM)).assertTrue();
      expect(ThreatModel.isSeverityValid(SEVERITY_HIGH)).assertTrue();
      expect(ThreatModel.isSeverityValid(SEVERITY_CRITICAL)).assertTrue();
      expect(ThreatModel.isSeverityValid('unknown')).assertFalse();
      const model = new ThreatModel();
      expect(model.add('T-01', CATEGORY_INPUT, 'unknown', 'm')).assertFalse();
      expect(model.size()).assertEqual(0);
    });

    it('model_should_validate_category', 0, () => {
      expect(ThreatModel.isCategoryValid(CATEGORY_DATA)).assertTrue();
      expect(ThreatModel.isCategoryValid(CATEGORY_NETWORK)).assertTrue();
      expect(ThreatModel.isCategoryValid(CATEGORY_INPUT)).assertTrue();
      expect(ThreatModel.isCategoryValid(CATEGORY_STORAGE)).assertTrue();
      expect(ThreatModel.isCategoryValid(CATEGORY_PERMISSION)).assertTrue();
      expect(ThreatModel.isCategoryValid('unknown')).assertFalse();
      expect(new ThreatModel().add('T-01', 'unknown', SEVERITY_HIGH, 'm')).assertFalse();
    });

    it('model_should_count_mitigations', 0, () => {
      const model = new ThreatModel();
      model.add('T-01', CATEGORY_INPUT, SEVERITY_HIGH, 'sanitize');
      model.add('T-02', CATEGORY_DATA, SEVERITY_CRITICAL, '');
      model.add('T-03', CATEGORY_NETWORK, SEVERITY_MEDIUM, 'https');
      expect(model.size()).assertEqual(3);
      expect(model.mitigatedCount()).assertEqual(2);
      expect(model.unmitigated().length).assertEqual(1);
      expect(model.unmitigated()[0].id).assertEqual('T-02');
      expect(model.coverage()).assertClose(66.667, 0.01);
    });

    it('model_should_filter_by_severity', 0, () => {
      const model = ThreatModelFactory.build();
      expect(model.bySeverity(SEVERITY_CRITICAL).length).assertEqual(1);
      expect(model.bySeverity(SEVERITY_HIGH).length).assertEqual(2);
      expect(model.bySeverity(SEVERITY_MEDIUM).length).assertEqual(2);
      expect(model.bySeverity(SEVERITY_LOW).length).assertEqual(0);
      expect(model.bySeverity('unknown').length).assertEqual(0);
    });

    it('model_should_filter_by_category', 0, () => {
      const model = ThreatModelFactory.build();
      expect(model.byCategory(CATEGORY_INPUT).length).assertEqual(1);
      expect(model.byCategory(CATEGORY_DATA).length).assertEqual(1);
      expect(model.byCategory(CATEGORY_NETWORK).length).assertEqual(1);
      expect(model.byCategory(CATEGORY_STORAGE).length).assertEqual(1);
      expect(model.byCategory(CATEGORY_PERMISSION).length).assertEqual(1);
      expect(ThreatModelFactory.expectedCategories().length).assertEqual(5);
    });

    it('model_should_detect_critical_gap', 0, () => {
      const model = ThreatModelFactory.build();
      expect(model.hasCriticalUnmitigated()).assertFalse();
      expect(model.coverage()).assertEqual(100);
      const gap = ThreatModelFactory.withGap();
      expect(gap.hasCriticalUnmitigated()).assertTrue();
      expect(gap.unmitigated().length).assertEqual(1);
    });

    it('model_should_enforce_capacity', 0, () => {
      const model = new ThreatModel();
      for (let i = 0; i < MAX_THREATS; i++) {
        expect(model.add(`T-${i}`, CATEGORY_INPUT, SEVERITY_LOW, 'm')).assertTrue();
      }
      expect(model.add('overflow', CATEGORY_INPUT, SEVERITY_LOW, 'm')).assertFalse();
      expect(model.size()).assertEqual(MAX_THREATS);
      model.clear();
      expect(model.size()).assertEqual(0);
      expect(model.coverage()).assertEqual(0);
    });

    it('plan_should_track_unmitigated', 0, () => {
      const model = ThreatModelFactory.withGap();
      const plan = new MitigationPlan();
      plan.build(model.unmitigated());
      expect(plan.count()).assertEqual(1);
      expect(plan.ids()).assertDeepEquals(['T-06']);
      expect(plan.contains('T-06')).assertTrue();
      expect(plan.contains('T-01')).assertFalse();
      expect(plan.hasCritical()).assertTrue();
      expect(plan.isReady()).assertFalse();
    });

    it('plan_should_be_ready_without_gaps', 0, () => {
      const model = ThreatModelFactory.build();
      const plan = new MitigationPlan();
      plan.build(model.unmitigated());
      expect(plan.count()).assertEqual(0);
      expect(plan.isReady()).assertTrue();
      expect(plan.hasCritical()).assertFalse();
      plan.clear();
      expect(plan.count()).assertEqual(0);
    });

    it('threat_flow_should_block_release_with_gap', 0, () => {
      const model = ThreatModelFactory.withGap();
      const plan = new MitigationPlan();
      plan.build(model.unmitigated());
      expect(model.hasCriticalUnmitigated()).assertTrue();
      expect(plan.hasCritical()).assertTrue();
      expect(plan.isReady()).assertFalse();
      expect(model.coverage()).assertClose(83.333, 0.01);
    });

    it('threat_flow_should_allow_release_when_covered', 0, () => {
      const model = ThreatModelFactory.build();
      const plan = new MitigationPlan();
      plan.build(model.unmitigated());
      expect(model.hasCriticalUnmitigated()).assertFalse();
      expect(plan.isReady()).assertTrue();
      expect(model.coverage()).assertEqual(100);
      expect(model.mitigatedCount()).assertEqual(5);
    });

    it('threat_constants_should_be_stable', 0, () => {
      expect(SEVERITY_LOW).assertEqual('low');
      expect(SEVERITY_MEDIUM).assertEqual('medium');
      expect(SEVERITY_HIGH).assertEqual('high');
      expect(SEVERITY_CRITICAL).assertEqual('critical');
      expect(CATEGORY_DATA).assertEqual('data');
      expect(CATEGORY_NETWORK).assertEqual('network');
      expect(CATEGORY_INPUT).assertEqual('input');
      expect(CATEGORY_STORAGE).assertEqual('storage');
      expect(CATEGORY_PERMISSION).assertEqual('permission');
      expect(MAX_THREATS).assertEqual(32);
    });

    it('model_should_expose_threat_details', 0, () => {
      const model = ThreatModelFactory.build();
      const threat = model.get('T-02') as Threat;
      expect(threat.id).assertEqual('T-02');
      expect(threat.category).assertEqual(CATEGORY_DATA);
      expect(threat.severity).assertEqual(SEVERITY_CRITICAL);
      expect(threat.mitigated).assertTrue();
      expect(threat.mitigation.length).assertLarger(0);
      expect(model.get('missing') === undefined).assertTrue();
    });

    it('model_should_report_unmitigated_details', 0, () => {
      const model = ThreatModelFactory.withGap();
      const unmitigated = model.unmitigated();
      expect(unmitigated.length).assertEqual(1);
      expect(unmitigated[0].id).assertEqual('T-06');
      expect(unmitigated[0].mitigation).assertEqual('');
      expect(unmitigated[0].severity).assertEqual(SEVERITY_CRITICAL);
      expect(model.bySeverity(SEVERITY_CRITICAL).length).assertEqual(2);
    });

    it('model_should_handle_empty_coverage', 0, () => {
      const model = new ThreatModel();
      expect(model.coverage()).assertEqual(0);
      expect(model.hasCriticalUnmitigated()).assertFalse();
      expect(model.unmitigated().length).assertEqual(0);
      expect(model.mitigatedCount()).assertEqual(0);
    });

    it('factory_should_cover_all_categories', 0, () => {
      const model = ThreatModelFactory.build();
      const categories = ThreatModelFactory.expectedCategories();
      expect(model.size()).assertEqual(5);
      expect(model.size()).assertEqual(categories.length);
      for (let i = 0; i < categories.length; i++) {
        expect(model.byCategory(categories[i]).length).assertEqual(1);
        expect(ThreatModel.isCategoryValid(categories[i])).assertTrue();
      }
      expect(model.coverage()).assertEqual(100);
    });

    it('model_should_scale_coverage', 0, () => {
      const model = new ThreatModel();
      model.add('a', CATEGORY_INPUT, SEVERITY_LOW, 'm');
      model.add('b', CATEGORY_INPUT, SEVERITY_LOW, '');
      model.add('c', CATEGORY_INPUT, SEVERITY_LOW, '');
      model.add('d', CATEGORY_INPUT, SEVERITY_LOW, '');
      expect(model.coverage()).assertEqual(25);
      expect(model.mitigatedCount()).assertEqual(1);
      expect(model.unmitigated().length).assertEqual(3);
      expect(model.bySeverity(SEVERITY_LOW).length).assertEqual(4);
    });

    it('plan_should_prioritize_critical_gaps', 0, () => {
      const model = new ThreatModel();
      model.add('low-gap', CATEGORY_INPUT, SEVERITY_LOW, '');
      model.add('critical-gap', CATEGORY_DATA, SEVERITY_CRITICAL, '');
      const plan = new MitigationPlan();
      plan.build(model.unmitigated());
      expect(plan.count()).assertEqual(2);
      expect(plan.hasCritical()).assertTrue();
      expect(plan.contains('low-gap')).assertTrue();
      expect(plan.contains('critical-gap')).assertTrue();
      expect(plan.isReady()).assertFalse();
    });

    it('plan_should_clear_between_builds', 0, () => {
      const model = ThreatModelFactory.withGap();
      const plan = new MitigationPlan();
      plan.build(model.unmitigated());
      expect(plan.count()).assertEqual(1);
      plan.build([]);
      expect(plan.count()).assertEqual(0);
      expect(plan.isReady()).assertTrue();
      expect(plan.hasCritical()).assertFalse();
      plan.clear();
      expect(plan.count()).assertEqual(0);
    });

    it('severity_ordering_should_be_deterministic', 0, () => {
      const severities: string[] = [SEVERITY_LOW, SEVERITY_MEDIUM, SEVERITY_HIGH, SEVERITY_CRITICAL];
      for (let i = 0; i < severities.length; i++) {
        expect(ThreatModel.isSeverityValid(severities[i])).assertTrue();
      }
      expect(ThreatModel.isSeverityValid(severities[0]) &&
        ThreatModel.isSeverityValid(severities[3])).assertTrue();
      expect(ThreatModel.isSeverityValid('')).assertFalse();
    });

    it('model_should_count_by_severity_matrix', 0, () => {
      const model = ThreatModelFactory.build();
      const severities: string[] = [SEVERITY_LOW, SEVERITY_MEDIUM, SEVERITY_HIGH, SEVERITY_CRITICAL];
      let total: number = 0;
      for (let i = 0; i < severities.length; i++) {
        total += model.bySeverity(severities[i]).length;
      }
      expect(total).assertEqual(model.size());
      expect(model.bySeverity(SEVERITY_LOW).length).assertEqual(0);
      expect(model.bySeverity(SEVERITY_CRITICAL).length).assertEqual(1);
    });

    it('model_should_reject_duplicate_ids_across_categories', 0, () => {
      const model = new ThreatModel();
      expect(model.add('same', CATEGORY_INPUT, SEVERITY_LOW, 'm')).assertTrue();
      expect(model.add('same', CATEGORY_DATA, SEVERITY_CRITICAL, 'm')).assertFalse();
      expect(model.size()).assertEqual(1);
      expect(model.byCategory(CATEGORY_INPUT).length).assertEqual(1);
      expect(model.byCategory(CATEGORY_DATA).length).assertEqual(0);
    });

    it('release_gate_should_require_full_mitigation', 0, () => {
      const model = ThreatModelFactory.build();
      const plan = new MitigationPlan();
      plan.build(model.unmitigated());
      expect(model.coverage()).assertEqual(100);
      expect(plan.isReady()).assertTrue();
      expect(model.hasCriticalUnmitigated()).assertFalse();
      const gapModel = ThreatModelFactory.withGap();
      const gapPlan = new MitigationPlan();
      gapPlan.build(gapModel.unmitigated());
      expect(gapPlan.isReady()).assertFalse();
      expect(gapModel.coverage()).assertLess(100);
    });

    it('threat_model_flow_should_summarize_state', 0, () => {
      const model = ThreatModelFactory.withGap();
      const plan = new MitigationPlan();
      plan.build(model.unmitigated());
      const totalThreats = model.size();
      const mitigated = model.mitigatedCount();
      const gaps = plan.count();
      expect(totalThreats).assertEqual(6);
      expect(mitigated).assertEqual(5);
      expect(gaps).assertEqual(1);
      expect(totalThreats - mitigated).assertEqual(gaps);
      expect(model.byCategory(CATEGORY_NETWORK).length).assertEqual(2);
      expect(model.bySeverity(SEVERITY_CRITICAL).length).assertEqual(2);
      expect(plan.ids()[0]).assertEqual('T-06');
    });

    it('threat_model_matrix_should_be_complete', 0, () => {
      const model = ThreatModelFactory.build();
      const categories = ThreatModelFactory.expectedCategories();
      const severities: string[] = [SEVERITY_LOW, SEVERITY_MEDIUM, SEVERITY_HIGH, SEVERITY_CRITICAL];
      let checked: number = 0;
      for (let i = 0; i < categories.length; i++) {
        const threats = model.byCategory(categories[i]);
        expect(threats.length).assertEqual(1);
        expect(threats[0].mitigated).assertTrue();
        expect(threats[0].mitigation.length).assertLarger(0);
        checked++;
      }
      for (let j = 0; j < severities.length; j++) {
        expect(ThreatModel.isSeverityValid(severities[j])).assertTrue();
      }
      expect(checked).assertEqual(categories.length);
      expect(model.size()).assertEqual(5);
      expect(model.mitigatedCount()).assertEqual(5);
      expect(model.unmitigated().length).assertEqual(0);
    });

    it('mitigation_plan_should_be_empty_for_full_coverage', 0, () => {
      const full = ThreatModelFactory.build();
      const emptyModel = new ThreatModel();
      const fullPlan = new MitigationPlan();
      const emptyPlan = new MitigationPlan();
      fullPlan.build(full.unmitigated());
      emptyPlan.build(emptyModel.unmitigated());
      expect(fullPlan.count()).assertEqual(0);
      expect(fullPlan.isReady()).assertTrue();
      expect(emptyPlan.count()).assertEqual(0);
      expect(emptyPlan.isReady()).assertTrue();
      expect(emptyPlan.hasCritical()).assertFalse();
      expect(full.coverage()).assertEqual(100);
      expect(emptyModel.coverage()).assertEqual(0);
    });

    it('threat_model_constants_matrix_should_be_stable', 0, () => {
      expect(SEVERITY_LOW).assertEqual('low');
      expect(SEVERITY_MEDIUM).assertEqual('medium');
      expect(SEVERITY_HIGH).assertEqual('high');
      expect(SEVERITY_CRITICAL).assertEqual('critical');
      expect(CATEGORY_DATA).assertEqual('data');
      expect(CATEGORY_NETWORK).assertEqual('network');
      expect(CATEGORY_INPUT).assertEqual('input');
      expect(CATEGORY_STORAGE).assertEqual('storage');
      expect(CATEGORY_PERMISSION).assertEqual('permission');
      expect(MAX_THREATS).assertEqual(32);
      expect(ThreatModelFactory.expectedCategories().length).assertEqual(5);
      expect(ThreatModel.isSeverityValid(SEVERITY_LOW)).assertTrue();
      expect(ThreatModel.isSeverityValid(SEVERITY_CRITICAL)).assertTrue();
      expect(ThreatModel.isCategoryValid(CATEGORY_DATA)).assertTrue();
      expect(ThreatModel.isCategoryValid(CATEGORY_STORAGE)).assertTrue();
      expect(MAX_THREATS).assertLarger(0);
      expect(ThreatModelFactory.build().size()).assertEqual(5);
      expect(ThreatModelFactory.build().coverage()).assertEqual(100);
      expect(ThreatModelFactory.withGap().size()).assertEqual(6);
      expect(ThreatModelFactory.withGap().hasCriticalUnmitigated()).assertTrue();
      expect(ThreatModelFactory.withGap().unmitigated().length).assertEqual(1);
      expect(ThreatModelFactory.build().unmitigated().length).assertEqual(0);
      expect(ThreatModelFactory.build().mitigatedCount()).assertEqual(5);
      expect(SEVERITY_CRITICAL.length).assertLarger(0);
      expect(CATEGORY_PERMISSION.length).assertEqual(10);
    });
  });
}


