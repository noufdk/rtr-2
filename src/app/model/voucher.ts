export class Voucher {
    id: string | null;
    title: string;
    points: number;
    items: string[];

    constructor( title: string, points: number, items: string[]) {
        this.id = null;
        this.title = title;
        this.points = points;
        this.items = items;
      }
}