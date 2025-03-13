import { Injectable } from "@nestjs/common";
import { AdoptionCatDto, UpdateCatDto } from "./cats.dto";

@Injectable()
export class CatsService {
	private cats = ["Alice", "Bob", "Charlie"];

	getCats(): string[] {
		return this.cats;
	}

	getCatByName(name: string): string {
		return this.cats.includes(name) ? name : "None";
	}

	AdoptionCat(adoptionCatDto: AdoptionCatDto) {
		!this.cats.includes(adoptionCatDto.name) && this.cats.push(adoptionCatDto.name);
		return "Adoption" + adoptionCatDto.name;
	}

	updateCat(name: string, updateCatDto: UpdateCatDto) {
		if (this.cats.includes(name)) {
			return "Updated" + name;
		}
		return "Update failed";
	}

	deleteCat(name: string) {
		const catIndex = this.cats.findIndex((cat) => cat === name);
		if (catIndex === -1) return { message: "Delete failed: Cat not found" };

		const deletedCat = this.cats.splice(catIndex, 1);
		return { message: `Deleted cat ${deletedCat}` };
	}
}
