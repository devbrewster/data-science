What are the column names?<br />

`id`, `user_id`, `order_date`, `restaurant_id`, `item_name`, `special_instructions`<br />

image.png
How recent is this data?<br />
`2017-06-30` is the most recent `order_date`
image.png

Instead of selecting all the columns using *, <br />
write a query that selects only the special_instructions column.<br />

Limit the result to 20 rows.<br />
image.png

Can you edit the query so that we are only returning the special instructions that are not empty?<br />
image.png

Let’s go even further and sort the instructions in alphabetical order (A-Z).<br />

image.png

Let’s search for special instructions that have the word ‘sauce’.<br />
image.png

Are there any funny or interesting ones? <br />

Let’s search for special instructions that have the word ‘door’.<br />
Any funny or interesting ones?<br />
`super hungover. let yourself in pass the fridge turn left and double doors my bedroom. im in my pajamas watching james bond 1love`<br />

Let’s search for special instructions that have the word ‘box’.<br />
Any funny or interesting ones?<br />
`Draw a dragon fighting flamingo on the pizza box.`<br />


Instead of just returning the special instructions, also return their order ids.<br />

For more readability:<br />
- Rename id as ‘#’<br />
- Rename special_instructions as ‘Notes’<br />


Challenge<br />
They have asked you to query the customer who made the phrase. <br />
Return the item_name restaurant_id, and user_id for the person created the phrase.<br />


`The spider on the front porch is Frank. Frank guards the tomatoes. Be nice to Frank.`<br />
`Walk to the garage and start singing the Lion King intro. I'll come out.`<br />

`Please make one additional tiny version of my order for my hamster.`<br />