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

const AREA_PRIVACY: string = 'privacy';

const AREA_STORAGE: string = 'storage';

const AREA_NETWORK: string = 'network';

const AREA_INPUT: string = 'input';

const AREA_LIFECYCLE: string = 'lifecycle';

const MAX_RULES: number = 40;

interface ComplianceRule {
  id: string;
  area: string;
  required: boolean;
  implemented: boolean;
  evidence: string;
}

// Tracks compliance rules and their implementation state
class ComplianceMatrix {
  private rules: Map<string, ComplianceRule> = new Map<string, ComplianceRule>();

  public add(id: string, area: string, required: boolean, implemented: boolean,
    evidence: string = ''): boolean {
    if (id.length === 0 || this.rules.has(id) || this.rules.size >= MAX_RULES) {
      return false;
    }
    if (!ComplianceMatrix.isAreaValid(area)) {
      return false;
    }
    if (implemented && evidence.length === 0) {
      return false;
    }
    this.rules.set(id, {
      id: id,
      area: area,
      required: required,
      implemented: implemented,
      evidence: evidence
    });
    return true;
  }

  public static isAreaValid(area: string): boolean {
    return area === AREA_PRIVACY || area === AREA_STORAGE || area === AREA_NETWORK ||
      area === AREA_INPUT || area === AREA_LIFECYCLE;
  }

  public size(): number {
    return this.rules.size;
  }

  public get(id: string): ComplianceRule | undefined {
    return this.rules.get(id);
  }

  public byArea(area: string): ComplianceRule[] {
    const result: ComplianceRule[] = [];
    this.rules.forEach((rule: ComplianceRule) => {
      if (rule.area === area) {
        result.push(rule);
      }
    });
    return result;
  }

  public gaps(): ComplianceRule[] {
    const result: ComplianceRule[] = [];
    this.rules.forEach((rule: ComplianceRule) => {
      if (rule.required && !rule.implemented) {
        result.push(rule);
      }
    });
    return result;
  }

  public requiredCount(): number {
    let count: number = 0;
    this.rules.forEach((rule: ComplianceRule) => {
      if (rule.required) {
        count++;
      }
    });
    return count;
  }

  public implementedCount(): number {
    let count: number = 0;
    this.rules.forEach((rule: ComplianceRule) => {
      if (rule.implemented) {
        count++;
      }
    });
    return count;
  }

  public coverage(): number {
    const required = this.requiredCount();
    if (required === 0) {
      return 0;
    }
    let requiredImplemented: number = 0;
    this.rules.forEach((rule: ComplianceRule) => {
      if (rule.required && rule.implemented) {
        requiredImplemented++;
      }
    });
    return requiredImplemented * 100 / required;
  }

  public areaCoverage(area: string): number {
    const rules = this.byArea(area);
    if (rules.length === 0) {
      return 0;
    }
    let implemented: number = 0;
    for (let i = 0; i < rules.length; i++) {
      if (rules[i].implemented) {
        implemented++;
      }
    }
    return implemented * 100 / rules.length;
  }

  public isCompliant(): boolean {
    return this.gaps().length === 0 && this.rules.size > 0;
  }

  public clear(): void {
    this.rules = new Map<string, ComplianceRule>();
  }
}

// Builds the default compliance matrix for the beta club
class ComplianceFactory {
  public static build(): ComplianceMatrix {
    const matrix = new ComplianceMatrix();
    matrix.add('PRIV-01', AREA_PRIVACY, true, true, 'consent registry');
    matrix.add('PRIV-02', AREA_PRIVACY, true, true, 'sensitive field masking');
    matrix.add('STOR-01', AREA_STORAGE, true, true, 'secure storage encryption');
    matrix.add('STOR-02', AREA_STORAGE, true, true, 'quota enforcement');
    matrix.add('NET-01', AREA_NETWORK, true, true, 'host allowlist');
    matrix.add('NET-02', AREA_NETWORK, true, true, 'https only');
    matrix.add('INP-01', AREA_INPUT, true, true, 'html stripping');
    matrix.add('INP-02', AREA_INPUT, true, true, 'length validation');
    matrix.add('LIFE-01', AREA_LIFECYCLE, true, true, 'resource release');
    matrix.add('LIFE-02', AREA_LIFECYCLE, false, false);
    return matrix;
  }

  public static withGap(): ComplianceMatrix {
    const matrix = new ComplianceMatrix();
    matrix.add('PRIV-01', AREA_PRIVACY, true, true, 'consent registry');
    matrix.add('NET-01', AREA_NETWORK, true, false);
    matrix.add('INP-01', AREA_INPUT, true, true, 'html stripping');
    return matrix;
  }

  public static areas(): string[] {
    return [AREA_PRIVACY, AREA_STORAGE, AREA_NETWORK, AREA_INPUT, AREA_LIFECYCLE];
  }
}

// Audits implementation evidence for compliance rules
class ComplianceAudit {
  private checks: string[] = [];
  private failureItems: string[] = [];

  public check(name: string, passed: boolean): void {
    this.checks.push(name);
    if (!passed) {
      this.failureItems.push(name);
    }
  }

  public count(): number {
    return this.checks.length;
  }

  public failures(): string[] {
    return [...this.failureItems];
  }

  public isPassed(): boolean {
    return this.checks.length > 0 && this.failureItems.length === 0;
  }

  public summary(): string {
    return this.isPassed() ? 'compliant' : 'non-compliant';
  }

  public reset(): void {
    this.checks = [];
    this.failureItems = [];
  }
}

export default function complianceMatrixTest() {
  describe('ComplianceMatrix_Test', () => {

    it('matrix_should_add_rules', 0, () => {
      const matrix = new ComplianceMatrix();
      expect(matrix.add('R-01', AREA_PRIVACY, true, true, 'evidence')).assertTrue();
      expect(matrix.add('R-01', AREA_PRIVACY, true, true, 'evidence')).assertFalse();
      expect(matrix.add('', AREA_PRIVACY, true, true, 'evidence')).assertFalse();
      expect(matrix.size()).assertEqual(1);
      expect(matrix.get('R-01') !== undefined).assertTrue();
    });

    it('matrix_should_reject_invalid_area', 0, () => {
      const matrix = new ComplianceMatrix();
      expect(matrix.add('R-01', 'unknown', true, true, 'evidence')).assertFalse();
      expect(matrix.size()).assertEqual(0);
      expect(ComplianceMatrix.isAreaValid(AREA_PRIVACY)).assertTrue();
      expect(ComplianceMatrix.isAreaValid(AREA_STORAGE)).assertTrue();
      expect(ComplianceMatrix.isAreaValid(AREA_NETWORK)).assertTrue();
      expect(ComplianceMatrix.isAreaValid(AREA_INPUT)).assertTrue();
      expect(ComplianceMatrix.isAreaValid(AREA_LIFECYCLE)).assertTrue();
    });

    it('matrix_should_require_evidence_for_implemented', 0, () => {
      const matrix = new ComplianceMatrix();
      expect(matrix.add('R-01', AREA_INPUT, true, true, '')).assertFalse();
      expect(matrix.add('R-02', AREA_INPUT, true, false, '')).assertTrue();
      expect(matrix.size()).assertEqual(1);
      expect(matrix.get('R-02') !== undefined).assertTrue();
    });

    it('matrix_should_filter_by_area', 0, () => {
      const matrix = ComplianceFactory.build();
      expect(matrix.byArea(AREA_PRIVACY).length).assertEqual(2);
      expect(matrix.byArea(AREA_STORAGE).length).assertEqual(2);
      expect(matrix.byArea(AREA_NETWORK).length).assertEqual(2);
      expect(matrix.byArea(AREA_INPUT).length).assertEqual(2);
      expect(matrix.byArea(AREA_LIFECYCLE).length).assertEqual(2);
      expect(matrix.byArea('unknown').length).assertEqual(0);
    });

    it('matrix_should_compute_coverage', 0, () => {
      const matrix = ComplianceFactory.build();
      expect(matrix.requiredCount()).assertEqual(9);
      expect(matrix.implementedCount()).assertEqual(9);
      expect(matrix.coverage()).assertEqual(100);
      expect(matrix.isCompliant()).assertTrue();
      expect(matrix.gaps().length).assertEqual(0);
    });

    it('matrix_should_detect_gaps', 0, () => {
      const matrix = ComplianceFactory.withGap();
      expect(matrix.size()).assertEqual(3);
      expect(matrix.requiredCount()).assertEqual(3);
      expect(matrix.implementedCount()).assertEqual(2);
      expect(matrix.gaps().length).assertEqual(1);
      expect(matrix.gaps()[0].id).assertEqual('NET-01');
      expect(matrix.isCompliant()).assertFalse();
      expect(matrix.coverage()).assertClose(66.667, 0.01);
    });

    it('matrix_should_compute_area_coverage', 0, () => {
      const matrix = ComplianceFactory.withGap();
      expect(matrix.areaCoverage(AREA_PRIVACY)).assertEqual(100);
      expect(matrix.areaCoverage(AREA_NETWORK)).assertEqual(0);
      expect(matrix.areaCoverage(AREA_INPUT)).assertEqual(100);
      expect(matrix.areaCoverage(AREA_STORAGE)).assertEqual(0);
      expect(matrix.areaCoverage('unknown')).assertEqual(0);
    });

    it('matrix_should_handle_empty_state', 0, () => {
      const matrix = new ComplianceMatrix();
      expect(matrix.size()).assertEqual(0);
      expect(matrix.requiredCount()).assertEqual(0);
      expect(matrix.implementedCount()).assertEqual(0);
      expect(matrix.coverage()).assertEqual(0);
      expect(matrix.isCompliant()).assertFalse();
      expect(matrix.gaps().length).assertEqual(0);
    });

    it('matrix_should_enforce_capacity', 0, () => {
      const matrix = new ComplianceMatrix();
      for (let i = 0; i < MAX_RULES; i++) {
        expect(matrix.add(`R-${i}`, AREA_PRIVACY, true, true, 'e')).assertTrue();
      }
      expect(matrix.add('overflow', AREA_PRIVACY, true, true, 'e')).assertFalse();
      expect(matrix.size()).assertEqual(MAX_RULES);
      matrix.clear();
      expect(matrix.size()).assertEqual(0);
    });

    it('matrix_should_ignore_optional_rules_in_gaps', 0, () => {
      const matrix = new ComplianceMatrix();
      matrix.add('OPT', AREA_LIFECYCLE, false, false);
      matrix.add('REQ', AREA_LIFECYCLE, true, true, 'e');
      expect(matrix.gaps().length).assertEqual(0);
      expect(matrix.isCompliant()).assertTrue();
      expect(matrix.implementedCount()).assertEqual(1);
      expect(matrix.requiredCount()).assertEqual(1);
    });

    it('audit_should_aggregate_checks', 0, () => {
      const audit = new ComplianceAudit();
      audit.check('privacy', true);
      audit.check('storage', true);
      expect(audit.count()).assertEqual(2);
      expect(audit.isPassed()).assertTrue();
      expect(audit.summary()).assertEqual('compliant');
      audit.check('network', false);
      expect(audit.summary()).assertEqual('non-compliant');
      expect(audit.failures()).assertDeepEquals(['network']);
      audit.reset();
      expect(audit.count()).assertEqual(0);
    });

    it('compliance_flow_should_gate_release', 0, () => {
      const matrix = ComplianceFactory.build();
      const audit = new ComplianceAudit();
      // Optional rules may stay unimplemented, the release gate only depends on the
      // required rules being fully covered.
      audit.check('coverage', matrix.coverage() >= 100);
      audit.check('compliant', matrix.isCompliant());
      audit.check('rule-count', matrix.size() === 10);
      expect(audit.isPassed()).assertTrue();
      expect(matrix.isCompliant()).assertTrue();
      expect(matrix.coverage()).assertEqual(100);
      expect(matrix.size()).assertEqual(10);
    });

    it('compliance_flow_should_block_on_gap', 0, () => {
      const matrix = ComplianceFactory.withGap();
      const audit = new ComplianceAudit();
      audit.check('coverage', matrix.coverage() === 100);
      audit.check('compliant', matrix.isCompliant());
      expect(audit.isPassed()).assertFalse();
      expect(audit.failures().length).assertEqual(2);
      expect(matrix.gaps()[0].area).assertEqual(AREA_NETWORK);
    });

    it('compliance_constants_should_be_stable', 0, () => {
      expect(AREA_PRIVACY).assertEqual('privacy');
      expect(AREA_STORAGE).assertEqual('storage');
      expect(AREA_NETWORK).assertEqual('network');
      expect(AREA_INPUT).assertEqual('input');
      expect(AREA_LIFECYCLE).assertEqual('lifecycle');
      expect(MAX_RULES).assertEqual(40);
      expect(ComplianceFactory.areas().length).assertEqual(5);
    });
  });
}


