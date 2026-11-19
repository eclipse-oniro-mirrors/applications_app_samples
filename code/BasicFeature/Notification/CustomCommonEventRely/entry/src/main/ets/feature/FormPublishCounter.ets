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
 * Keeps the number of events published by every service widget.
 */
export class FormPublishCounter {
    private counts: Map<string, number> = new Map<string, number>();
    private maxCount: number;

    /**
     * @param maxCount Upper limit of every counter, unbounded by default.
     */
    constructor(maxCount: number = Number.MAX_SAFE_INTEGER) {
        this.maxCount = maxCount > 0 ? Math.floor(maxCount) : Number.MAX_SAFE_INTEGER;
    }

    /**
     * @param formId Identity of the widget.
     * @returns Publish count, 0 when the widget never published.
     */
    get(formId: string): number {
        let count: number | undefined = this.counts.get(formId);
        return count === undefined ? 0 : count;
    }

    /**
     * Increases the publish count of the widget.
     *
     * @param formId Identity of the widget.
     * @returns Publish count after the increase, capped by the upper limit.
     */
    increment(formId: string): number {
        let next: number = this.get(formId) + 1;
        if (next > this.maxCount) {
            next = this.maxCount;
        }
        this.counts.set(formId, next);
        return next;
    }

    /**
     * @param formId Identity of the removed widget.
     * @returns True when a counter has been removed.
     */
    remove(formId: string): boolean {
        return this.counts.delete(formId);
    }

    /**
     * @returns Number of widgets that have their own counter.
     */
    size(): number {
        return this.counts.size;
    }

    /**
     * Removes every counter.
     */
    clear(): void {
        this.counts.clear();
    }
}