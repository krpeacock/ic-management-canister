import fs from "fs";
import path from "path";
import { $ } from "zx";
const candid = (
  await fetch(
    "https://raw.githubusercontent.com/dfinity/interface-spec/master/spec/_attachments/ic.did"
  )
).text();

fs.writeFileSync(path.resolve("tmp.did"), await candid);

const motoko = await $`didc bind tmp.did -t mo`;

fs.writeFileSync(path.resolve("src", "lib.mo"), motoko.toString());

await $`rm tmp.did`;

console.clear();
console.log("Successfully refreshed");
