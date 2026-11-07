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

const fs = require('fs');
const path = require('path');

const TEST_DIR = path.join(__dirname, 'entry', 'src', 'ohosTest', 'ets', 'test');
const files = fs.readdirSync(TEST_DIR).filter(f => f.endsWith('.test.ets'));

let totalCases = 0;
let duplicateNames = [];
let duplicateNumbers = [];
let metadataIssues = [];
let lowAssertionCases = [];

const allNames = new Map();
const allNumbers = new Map();

for (const file of files) {
  const content = fs.readFileSync(path.join(TEST_DIR, file), 'utf-8');
  const lines = content.split('\n');

  // Parse test cases
  let currentMeta = {};
  let inCase = false;
  let caseStartLine = 0;
  let caseBody = '';
  let braceDepth = 0;

  for (let i = 0; i < lines.length; i++) {
    const line = lines[i].trim();

    // Collect @tc metadata
    const tcMatch = line.match(/^\*\s*@tc\.(\w+)\s+(.+)$/);
    if (tcMatch) {
      currentMeta[`tc.${tcMatch[1]}`] = tcMatch[2].trim();
    }

    // Detect it() start
    const itMatch = line.match(/^it\(['"]([^'"]+)['"]/);
    if (itMatch && !inCase) {
      inCase = true;
      caseStartLine = i;
      currentMeta.itName = itMatch[1];
      caseBody = '';
      braceDepth = 0;
    }

    if (inCase) {
      caseBody += lines[i] + '\n';
      // Count braces
      for (const ch of lines[i]) {
        if (ch === '{') {
          braceDepth++;
        }
        if (ch === '}') {
          braceDepth--;
        }
      }

      // Detect it() end
      if (braceDepth <= 0 && caseBody.includes("it('") || caseBody.includes('it("')) {
        if (braceDepth <= 0 && i > caseStartLine) {
          totalCases++;

          // Check metadata
          const requiredFields = ['tc.number', 'tc.name', 'tc.desc', 'tc.size', 'tc.type', 'tc.level'];
          for (const field of requiredFields) {
            if (!currentMeta[field]) {
              metadataIssues.push(`${file} ${currentMeta.itName}: missing @${field}`);
            }
          }

          // Check name match
          if (currentMeta['tc.name'] && currentMeta['tc.name'] !== currentMeta.itName) {
            duplicateNames.push(`${file}: @tc.name=${currentMeta['tc.name']} != it('${currentMeta.itName}')`);
          }

          // Check number uniqueness
          if (currentMeta['tc.number']) {
            if (allNumbers.has(currentMeta['tc.number'])) {
              duplicateNumbers.push(`${file} ${currentMeta.itName}: duplicate @tc.number ${currentMeta['tc.number']} (also in ${allNumbers.get(currentMeta['tc.number'])})`);
            }
            allNumbers.set(currentMeta['tc.number'], `${file}:${currentMeta.itName}`);
          }

          // Check name uniqueness
          if (currentMeta['tc.name']) {
            const nameKey = currentMeta['tc.name'];
            if (allNames.has(nameKey)) {
              duplicateNames.push(`${file} ${currentMeta.itName}: duplicate @tc.name (also in ${allNames.get(nameKey)})`);
            }
            allNames.set(nameKey, `${file}:${currentMeta.itName}`);
          }

          // Count static expect calls (outside of helper functions)
          const staticExpects = (caseBody.match(/\bexpect\(/g) || []).length;
          if (staticExpects < 3) {
            lowAssertionCases.push(`${file} ${currentMeta.itName}: ${staticExpects} static expect calls`);
          }

          inCase = false;
          currentMeta = {};
          caseBody = '';
        }
      }
    }
  }
}

console.log(`\n===== Audit Results =====`);
console.log(`Total cases: ${totalCases}`);
console.log(`Duplicate @tc.name: ${duplicateNames.length}`);
duplicateNames.forEach(d => console.log(`  - ${d}`));
console.log(`Duplicate @tc.number: ${duplicateNumbers.length}`);
duplicateNumbers.forEach(d => console.log(`  - ${d}`));
console.log(`Metadata issues: ${metadataIssues.length}`);
metadataIssues.forEach(d => console.log(`  - ${d}`));
console.log(`\nLow assertion cases (<3 static expects): ${lowAssertionCases.length}`);
lowAssertionCases.forEach(d => console.log(`  - ${d}`));
console.log(`\nStatus: ${duplicateNames.length === 0 && duplicateNumbers.length === 0 && metadataIssues.length === 0 ? 'PASS' : 'FAIL'}`);
