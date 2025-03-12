import { Injectable } from "@nestjs/common";

@Injectable()
export class UserService {
	private users = ["Alice", "Bob", "Charlie"];

	getUsers(): string[] {
		return this.users;
	}
}
