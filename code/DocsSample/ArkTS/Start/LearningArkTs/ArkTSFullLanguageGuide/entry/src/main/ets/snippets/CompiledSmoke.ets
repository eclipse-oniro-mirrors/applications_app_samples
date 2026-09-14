/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { loadCompiledDocSnippets } from './CompiledDocs';

interface GuideUser {
  id: number;
  name: string;
}

class GuideUserService {
  private users: GuideUser[] = [];

  add(user: GuideUser): void {
    this.users.push(user);
  }

  getFirstName(): string {
    if (this.users.length === 0) {
      return 'none';
    }
    return this.users[0].name;
  }
}

function buildGuideUser(id: number, name: string): GuideUser {
  return {
    id: id,
    name: name
  };
}

function summarizeScores(scores: number[]): number {
  let total: number = 0;
  for (let score of scores) {
    total += score;
  }
  return total;
}

async function loadGuideTitle(): Promise<string> {
  return Promise.resolve('ArkTS Full Language Guide');
}

export async function runFullLanguageGuideSmoke(): Promise<string> {
  let service: GuideUserService = new GuideUserService();
  service.add(buildGuideUser(1, 'Alice'));

  let totalScore: number = summarizeScores([80, 90, 100]);
  let title: string = await loadGuideTitle();

  return `${title}: ${service.getFirstName()}, ${totalScore}, snippets=${loadCompiledDocSnippets()}`;
}
