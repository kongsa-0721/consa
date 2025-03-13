import { Injectable } from "@nestjs/common";

@Injectable()
export class CatsService {
	private cats = ["Alice", "Bob", "Charlie"];

	getCats(): string[] {
		return this.cats;
	}
}
